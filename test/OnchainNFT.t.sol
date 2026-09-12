// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {OnchainNFT} from "../src/onChainNFT.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {IERC721Errors} from "@openzeppelin/contracts/interfaces/draft-IERC6093.sol";

contract OnchainNFTTest is Test {
    OnchainNFT public nft;
    address public owner = address(0xABCD);
    address public user = address(0xBEEF);

    function setUp() public {
        vm.prank(owner);
        nft = new OnchainNFT("Onchain Artifact", "ARTIFACT", owner);
    }

    function test_InitialState() public view {
        assertEq(nft.name(), "Onchain Artifact");
        assertEq(nft.symbol(), "ARTIFACT");
        assertEq(nft.owner(), owner);
        assertFalse(nft.hasKey("metadata"));
        assertFalse(nft.hasKey("image"));
    }

    function test_SaveAndGetData_SinglePage() public {
        bytes memory sampleSvg = "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><circle cx='50' cy='50' r='40' fill='red'/></svg>";
        
        vm.prank(owner);
        nft.saveData("image", 0, sampleSvg);

        assertTrue(nft.hasKey("image"));
        assertEq(nft.getSizeOfPages("image"), sampleSvg.length);
        assertEq(nft.getData("image"), sampleSvg);
        assertEq(nft.genRawImage(), string(abi.encodePacked("data:image/svg+xml;utf8,", sampleSvg)));
    }

    function test_SaveAndGetData_MultiplePages() public {
        // Create 60KB test data (spans 3 pages)
        uint256 totalSize = 60000;
        bytes memory fullData = new bytes(totalSize);
        for (uint256 i = 0; i < totalSize; i++) {
            fullData[i] = bytes1(uint8((i % 250) + 1));
        }

        uint256 chunkSize = 20000;
        uint256 numPages = 3;

        vm.startPrank(owner);
        for (uint256 p = 0; p < numPages; p++) {
            bytes memory chunk = new bytes(chunkSize);
            for (uint256 j = 0; j < chunkSize; j++) {
                chunk[j] = fullData[p * chunkSize + j];
            }
            nft.saveData("bigData", uint128(p), chunk);
        }
        vm.stopPrank();

        assertEq(nft.getSizeOfPages("bigData"), totalSize);
        bytes memory retrieved = nft.getData("bigData");
        assertEq(retrieved.length, totalSize);
        assertEq(keccak256(retrieved), keccak256(fullData));
    }

    function test_RevokeContractData() public {
        bytes memory testData = "test metadata payload";
        vm.startPrank(owner);
        nft.saveData("metadata", 0, testData);
        assertTrue(nft.hasKey("metadata"));

        nft.revokeContractData("metadata");
        vm.stopPrank();

        assertFalse(nft.hasKey("metadata"));
        assertEq(nft.getSizeOfPages("metadata"), 0);
        assertEq(nft.getData("metadata").length, 0);
    }

    function test_ExceededMaxContractSizeReverts() public {
        bytes memory tooBig = new bytes(24576);
        vm.prank(owner);
        vm.expectRevert("OnchainNFT: Exceeded 24,576 bytes max contract size");
        nft.saveData("test", 0, tooBig);
    }

    function test_MintAndTokenURI_Base64() public {
        string memory base64Metadata = "eyJuYW1lIjogIk9uY2hhaW4gTlFUIiwgImRlc2NyaXB0aW9uIjogIkZ1bGx5IG9uY2hhaW4iLCAiaW1hZ2UiOiAiZGF0YTppbWFnZS9zdmcreG1sO2Jhc2U2NCxQRDk0..." ;
        
        vm.startPrank(owner);
        nft.saveData("metadata", 0, bytes(base64Metadata));
        uint256 tokenId = nft.mint(user);
        vm.stopPrank();

        assertEq(tokenId, 0);
        assertEq(nft.ownerOf(0), user);
        assertEq(nft.balanceOf(user), 1);

        string memory uri = nft.tokenURI(0);
        assertEq(uri, string(abi.encodePacked("data:application/json;base64,", base64Metadata)));
    }

    function test_MintAndTokenURI_RawJson() public {
        string memory rawJson = '{"name":"Onchain NFT","description":"100% onchain","image":"data:image/svg+xml;utf8,<svg></svg>"}';
        
        vm.startPrank(owner);
        nft.saveData("metadata", 0, bytes(rawJson));
        uint256 tokenId = nft.mint(user);
        vm.stopPrank();

        assertEq(tokenId, 0);
        string memory uri = nft.tokenURI(0);
        assertEq(uri, string(abi.encodePacked("data:application/json;utf8,", rawJson)));
    }

    function test_NonexistentTokenURIReverts() public {
        vm.expectRevert(abi.encodeWithSelector(IERC721Errors.ERC721NonexistentToken.selector, 999));
        nft.tokenURI(999);
    }

    function test_OnlyOwnerCanSaveDataAndMint() public {
        vm.startPrank(user);
        
        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, user));
        nft.saveData("metadata", 0, "sample");

        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, user));
        nft.mint(user);

        vm.stopPrank();
    }
}
