// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title A sample Raffle contract. It is automated using chainlink automation.
 * @author Harsh Anand.
 * @notice This contract is for creating a sample raffle.
 * @dev Implemeting Chainlink VRFv2.
 */

import {D1} from "./D1.sol";
import {D2} from "./D2.sol";
import {D3} from "./D3.sol";
import {D4} from "./D4.sol";
import {D5} from "./D5.sol";

contract Main {
    D1 first = new D1();
    D2 second = new D2();
    D3 third = new D3();
    D4 fourth = new D4();
    D5 fifth = new D5();

    function getFirstData() public view returns (uint256) {
        // uint256 ans = first.response;
        // return first.response;
    }
}
