// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {OnchainNFT} from "../src/onChainNFT.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";


// Repository: https://github.com/feranmiba/nft.git
// Commit: 7a60ebf
// Testnet: Sepolia
// Contract: https://sepolia.etherscan.io/address/0x18F00Aef5811d3c4E69777b2a027fd61083dA377
// Deployment transaction: https://sepolia.etherscan.io/tx/0x333e050e00c6e081c36ca9de15fe0fb2c9982d9cb953b3bae685b273aa22b79d
// Mint transaction: https://sepolia.etherscan.io/tx/0x94c4aa07638530221c4cc9b3d4ad7063dc0a7a3baa15e5a5016d2f64add11119

/**
 * @title DeployAndMint
 * @notice Foundry script to deploy OnchainNFT, upload SVG & metadata in bytecode chunks, and mint 1 NFT.
 */
contract DeployAndMint is Script {
    uint256 public constant CHUNK_SIZE = 24575;

    function run() external returns (address nftAddress, uint256 tokenId) {
        uint256 deployerPrivateKey;
        address deployer;

        try vm.envUint("PRIVATE_KEY") returns (uint256 pk) {
            deployerPrivateKey = pk;
            deployer = vm.addr(pk);
        } catch {
            deployer = msg.sender;
        }

        console.log("=== Deployer Address ===", deployer);

        // 1. Read SVG file from workspace
        string memory svgContent = vm.readFile("assest/assesmentreduced (1).svg");
        bytes memory rawSvgBytes = bytes(svgContent);
        console.log("Read SVG file, size in bytes:", rawSvgBytes.length);

        // 2. Base64 encode the SVG image
        string memory base64Svg = Base64.encode(rawSvgBytes);
        bytes memory imagePayload = bytes(base64Svg);
        console.log("Base64 SVG payload size in bytes:", imagePayload.length);

        // 3. Construct JSON metadata with the onchain data URI image
        string memory jsonMetadata = string(
            abi.encodePacked(
                '{"name": "Onchain Artifact #0", ',
                '"description": "100% Fully onchain SVG NFT powered by EVM bytecode storage", ',
                '"image": "data:image/svg+xml;base64,',
                base64Svg,
                '", "attributes": [{"trait_type": "Storage", "value": "EVM Bytecode"}, {"trait_type": "Onchain", "value": "100%"}]}'
            )
        );

        // 4. Base64 encode metadata JSON
        string memory base64Metadata = Base64.encode(bytes(jsonMetadata));
        bytes memory metadataPayload = bytes(base64Metadata);
        console.log("Base64 JSON metadata size in bytes:", metadataPayload.length);

        // 5. Start broadcasting transactions
        if (deployerPrivateKey != 0) {
            vm.startBroadcast(deployerPrivateKey);
        } else {
            vm.startBroadcast();
        }

        // 6. Deploy the OnchainNFT contract
        OnchainNFT nft = new OnchainNFT("Onchain Artifact", "ARTIFACT", deployer);
        nftAddress = address(nft);
        console.log("OnchainNFT deployed at:", nftAddress);

        // 7. Upload Image chunks (using bytecode storage)
        uploadChunks(nft, "image", imagePayload);

        // 8. Upload Metadata chunks (using bytecode storage)
        uploadChunks(nft, "metadata", metadataPayload);

        // 9. Mint 1 NFT
        tokenId = nft.mint(deployer);
        console.log("Minted token ID:", tokenId, "to owner:", deployer);

        vm.stopBroadcast();

        // 10. Verify token URI
        string memory tokenUri = nft.tokenURI(tokenId);
        console.log("Verified tokenURI length:", bytes(tokenUri).length);
        console.log("=== Deployment, Upload, and Mint completed successfully! ===");
    }

    function uploadChunks(OnchainNFT nft, string memory key, bytes memory data) internal {
        uint256 totalLength = data.length;
        uint256 totalChunks = (totalLength + CHUNK_SIZE - 1) / CHUNK_SIZE;
        console.log("Uploading key:", key, "| Total chunks:", totalChunks);

        for (uint256 i = 0; i < totalChunks; i++) {
            uint256 start = i * CHUNK_SIZE;
            uint256 end = start + CHUNK_SIZE;
            if (end > totalLength) {
                end = totalLength;
            }
            uint256 len = end - start;

            bytes memory chunk = new bytes(len);
            for (uint256 j = 0; j < len; j++) {
                chunk[j] = data[start + j];
            }

            nft.saveData(key, uint128(i), chunk);
            console.log("Saved page:", i, "bytes:", len);
        }
    }
}
