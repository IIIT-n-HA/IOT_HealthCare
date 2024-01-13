// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {D1} from "../src/D1.sol";

contract D1Test is Test {
    D1 first;

    function setUp() external {
        vm.startBroadcast();
        first = new D1();
        vm.stopBroadcast();
    }
}
