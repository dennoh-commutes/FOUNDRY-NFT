// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {MoodNft} from "../src/MoodNft.sol";
import {Script} from "forge-std/Script.sol";

contract MintMoodNft is Script {
    MoodNft moodNft;

    function run() external {
        address mostRecentlyDeployed = 0xceafEac8Ec6336609e632e0345830a0BA9d74519;

        mintNftOnContract(mostRecentlyDeployed);
    }
    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        MoodNft(contractAddress).mintNft();
        vm.stopBroadcast();
    }
}
contract FlipMood is Script {
    uint256 public constant TOKEN_ID_TO_FLIP = 0;

    function run() external {
        address mostRentlyDeployed = 0xceafEac8Ec6336609e632e0345830a0BA9d74519;

        flipMoodOnContract(mostRentlyDeployed, TOKEN_ID_TO_FLIP);
    }
    function flipMoodOnContract(
        address contractAddress,
        uint256 tokenId
    ) public {
        vm.startBroadcast();
        MoodNft(contractAddress).flipMood(tokenId);
        vm.stopBroadcast();
    }
}
