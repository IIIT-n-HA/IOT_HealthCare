// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {D2} from "../src/D2.sol";

contract D2Test is Test {
    D2 first;

    function setUp() external {
        vm.startBroadcast();
        first = new D2();
        vm.stopBroadcast();
    }
}
