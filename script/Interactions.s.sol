// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract MintBasicNft is Script {
    BasicNft basicNft;

    string public constant TOKEN_URI =
        "ipfs://QmP2AWoyQFuXnf4kzC2aqQQdzU3TjWjZZP33ep2o9QZXL7";

    function run() external {
        address mostRecentlyDeployed = 0x4c27a62cBA1d3F2A2C37aC54496DD792d741cB97;

        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(TOKEN_URI);
        vm.stopBroadcast();
    }
}
