// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {D5} from "../src/D5.sol";

contract D2Test is Test {
    D5 first;

    function setUp() external {
        vm.startBroadcast();
        first = new D5();
        vm.stopBroadcast();
    }
}
