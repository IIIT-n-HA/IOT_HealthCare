// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Main} from "../src/Main.sol";

contract DeployMain is Script {
    function run() external {
        vm.startBroadcast();
        Main main = new Main();
        vm.stopBroadcast();
    }
}
