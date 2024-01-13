// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Patient Data Management
 * @author Harsh Anand.
 * @notice This contract is for receiving patient's sensitive data feeds through api calls and storing it on blockchain.
 * @dev This project is using Chainlink's oracle for receiving data through api calls. For more details visit: https://docs.chain.link/
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
