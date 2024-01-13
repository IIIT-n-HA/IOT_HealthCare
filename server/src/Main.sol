// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title A sample Raffle contract. It is automated using chainlink automation.
 * @author Harsh Anand.
 * @notice This contract is for creating a sample raffle.
 * @dev Implemeting Chainlink VRFv2.
 */

import {ChainlinkClient} from "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import {Chainlink} from "@chainlink/contracts/src/v0.8/Chainlink.sol";
import {ConfirmedOwner} from "@chainlink/contracts/src/v0.8/shared/access/ConfirmedOwner.sol";

contract Main is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    address private oracleAddress;
    bytes32 private jobId;
    uint256 private fee;

    constructor() ConfirmedOwner(msg.sender) {
        _setChainlinkToken(0x779877A7B0D9E8603169DdbD7836e478b4624789);
        _setChainlinkOracle(0x0FaCf846af22BCE1C7f88D1d55A038F27747eD2B);
        jobId = "a8356f48569c434eaa4ac5fcb4db5cc0";
        fee = (1 * LINK_DIVISIBILITY) / 10;
    }

    function reuestFunction() public {
        Chainlink.Request memory req = _buildOperatorRequest(
            jobId,
            this.fulfill.selector
        );

        // DEFINE THE REQUEST PARAMETERS (example)
        req._add("method", "GET");
        req._add(
            "url",
            "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH&tsyms=USD,EUR"
        );
        req._add("headers", "");
        req._add("body", "");
        req._add("contact", "ENTER_YOUR_CONTACT_INFO_HERE"); // example values: "derek_linkwellnodes.io" (Discord handle) OR "derek@linkwellnodes.io" OR "+1-617-545-4721"

        // The following curl command simulates the above request parameters:
        // curl "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH&tsyms=USD,EUR" --request "GET" --header "content-type: application/json" --header "set-cookie: sid=14A52"

        // PROCESS THE RESULT (example)
        req._add("path", "ETH,USD");
        req._addInt("multiplier", 10 ** 18);

        // Send the request to the Chainlink oracle
        _sendOperatorRequest(req, fee);
    }

    uint256 public response;

    function fulfill(
        bytes32 requestId,
        uint256 data
    ) public recordChainlinkFulfillment(requestId) {
        // Process the oracle response
        // emit RequestFulfilled(requestId);    // (optional) emits this event in the on-chain transaction logs, allowing Web3 applications to listen for this transaction
        response = data; // example value: 1875870000000000000000 (1875.87 before "multiplier" is applied)
    }
}
