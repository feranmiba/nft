// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title OnchainNFT
 * @notice Fully onchain ERC-721 NFT that stores SVG image and JSON metadata using EVM bytecode storage.
 * @dev Large data chunks are deployed as immutable contract runtime bytecode and retrieved via EXTCODECOPY.
 */
contract OnchainNFT is ERC721, Ownable {
    uint256 private _nextTokenId;

    struct ContractData {
        address rawContract;
        uint128 size;
        uint128 offset;
    }

    struct ContractDataPages {
        uint256 maxPageNumber;
        bool exists;
        mapping(uint256 => ContractData) pages;
    }

    mapping(string => ContractDataPages) internal _contractDataPages;

    event DataSaved(string indexed key, uint128 indexed pageNumber, address indexed dataContract, uint128 size);
    event DataRevoked(string indexed key);
    event NFTMinted(address indexed to, uint256 indexed tokenId);

    constructor(
        string memory name_,
        string memory symbol_,
        address initialOwner
    ) ERC721(name_, symbol_) Ownable(initialOwner) {}

    /**
     * @notice Stores a chunk of data (up to 24,575 bytes) into an immutable bytecode storage contract.
     * @param _key Key identifier (e.g. "metadata", "image", "dan")
     * @param _pageNumber Zero-indexed page number for this chunk
     * @param _b Data bytes to store
     */
    function saveData(
        string memory _key,
        uint128 _pageNumber,
        bytes memory _b
    ) public onlyOwner {
        require(
            _b.length < 24576,
            "OnchainNFT: Exceeded 24,576 bytes max contract size"
        );

        // Header for creating data runtime bytecode:
        // PUSH2 size, PUSH1 0x0e, PUSH1 0x00, CODECOPY, PUSH2 size, PUSH1 0x00, RETURN
        bytes memory init = hex"610000_600e_6000_39_610000_6000_f3";
        bytes1 size1 = bytes1(uint8(_b.length));
        bytes1 size2 = bytes1(uint8(_b.length >> 8));
        init[2] = size1;
        init[1] = size2;
        init[10] = size1;
        init[9] = size2;

        bytes memory code = abi.encodePacked(init, _b);

        address dataContract;
        assembly {
            dataContract := create(0, add(code, 32), mload(code))
            if eq(dataContract, 0) {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }
        }

        saveDataForDeployedContract(
            _key,
            _pageNumber,
            dataContract,
            uint128(_b.length),
            0
        );

        emit DataSaved(_key, _pageNumber, dataContract, uint128(_b.length));
    }

    /**
     * @notice Internal helper to record deployed chunk contract metadata.
     */
    function saveDataForDeployedContract(
        string memory _key,
        uint256 _pageNumber,
        address dataContract,
        uint128 _size,
        uint128 _offset
    ) internal {
        ContractDataPages storage _cdPages = _contractDataPages[_key];

        if (_cdPages.maxPageNumber < _pageNumber) {
            _cdPages.maxPageNumber = _pageNumber;
        }

        _cdPages.exists = true;
        _cdPages.pages[_pageNumber] = ContractData(
            dataContract,
            _size,
            _offset
        );
    }

    /**
     * @notice Revokes/clears all stored pages for a given key.
     * @param _key Key identifier to clear
     */
    function revokeContractData(string memory _key) public onlyOwner {
        delete _contractDataPages[_key];
        emit DataRevoked(_key);
    }

    /**
     * @notice Computes total size in bytes across all pages for a key.
     * @param _key Key identifier
     */
    function getSizeOfPages(string memory _key) public view returns (uint256) {
        ContractDataPages storage _cdPages = _contractDataPages[_key];
        if (!_cdPages.exists) return 0;

        uint256 totalSize;
        for (uint256 idx; idx <= _cdPages.maxPageNumber; idx++) {
            totalSize += _cdPages.pages[idx].size;
        }
        return totalSize;
    }

    /**
     * @notice Reconstructs and returns the full concatenated byte payload for a key.
     * @param _key Key identifier
     */
    function getData(string memory _key) public view returns (bytes memory) {
        uint256 totalSize = getSizeOfPages(_key);
        if (totalSize == 0) return new bytes(0);

        bytes memory _totalData = new bytes(totalSize);
        ContractDataPages storage _cdPages = _contractDataPages[_key];

        uint256 currentPointer = 32;
        for (uint256 idx; idx <= _cdPages.maxPageNumber; idx++) {
            ContractData storage dataPage = _cdPages.pages[idx];
            address dataContract = dataPage.rawContract;
            uint256 size = uint256(dataPage.size);
            uint256 offset = uint256(dataPage.offset);

            assembly {
                extcodecopy(
                    dataContract,
                    add(_totalData, currentPointer),
                    offset,
                    size
                )
            }
            currentPointer += size;
        }

        return _totalData;
    }

    /**
     * @notice Checks whether data exists for a given key.
     */
    function hasKey(string memory _key) public view returns (bool) {
        return _contractDataPages[_key].exists;
    }

    /**
     * @notice Mint an NFT token to the specified address.
     * @param to Recipient address
     * @return tokenId The ID of the newly minted token
     */
    function mint(address to) public onlyOwner returns (uint256 tokenId) {
        tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        emit NFTMinted(to, tokenId);
    }

    /**
     * @notice Returns the metadata URI for a given token ID.
     * @dev Must return an onchain data URI; never IPFS or HTTP.
     * @param tokenId The token ID to query
     */
    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        _requireOwned(tokenId);
        return genMetadata();
    }

    /**
     * @notice Returns the full onchain metadata data URI.
     */
    function genMetadata() public view returns (string memory) {
        bytes memory metadataBytes = getData("metadata");
        if (metadataBytes.length == 0) {
            metadataBytes = getData("dan");
        }
        require(metadataBytes.length > 0, "OnchainNFT: No metadata uploaded");

        if (metadataBytes[0] == 0x7b || metadataBytes[0] == 0x20) {
            return string(abi.encodePacked("data:application/json;utf8,", metadataBytes));
        }

        return string(abi.encodePacked("data:application/json;base64,", metadataBytes));
    }

    /**
     * @notice Returns the onchain image data URI.
     */
    function genRawImage() public view returns (string memory) {
        bytes memory imageBytes = getData("image");
        require(imageBytes.length > 0, "OnchainNFT: No image uploaded");

        if (imageBytes[0] == 0x3c) {
            return string(abi.encodePacked("data:image/svg+xml;utf8,", imageBytes));
        }

        return string(abi.encodePacked("data:image/svg+xml;base64,", imageBytes));
    }
}