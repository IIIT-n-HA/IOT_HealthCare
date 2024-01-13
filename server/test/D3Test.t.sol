// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {D3} from "../src/D3.sol";

contract D2Test is Test {
    D3 first;

    function setUp() external {
        vm.startBroadcast();
        first = new D3();
        vm.stopBroadcast();
    }
}
