// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {D4} from "../src/D4.sol";

contract D2Test is Test {
    D4 first;

    function setUp() external {
        vm.startBroadcast();
        first = new D4();
        vm.stopBroadcast();
    }
}
