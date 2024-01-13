// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ChainlinkClient} from "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import {Chainlink} from "@chainlink/contracts/src/v0.8/Chainlink.sol";
import {ConfirmedOwner} from "@chainlink/contracts/src/v0.8/shared/access/ConfirmedOwner.sol";

contract D4 is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    address private oracleAddress;
    bytes32 private jobId;
    uint256 public fee; // is set to public just for testing purpose.

    constructor() ConfirmedOwner(msg.sender) {
        _setChainlinkToken(0x779877A7B0D9E8603169DdbD7836e478b4624789);
        _setChainlinkOracle(0x0FaCf846af22BCE1C7f88D1d55A038F27747eD2B);
        jobId = "a8356f48569c434eaa4ac5fcb4db5cc0";
        fee = (1 * LINK_DIVISIBILITY); // should be fixed according to the chain that we are using. Like for e.g., here we are using sepolia testnet.
    }

    function reuestFunction() public {
        Chainlink.Request memory req = _buildOperatorRequest(
            jobId,
            this.fulfill.selector
        );

        req._add("method", "GET");
        req._add(
            "url",
            "https://api.thingspeak.com/channels/2394024/feeds.json?api_key=W8KKZY03V4C4Z156&results=2"
        );
        req._add("headers", "");
        req._add("body", "");
        req._add("contact", "");
        req._add("path", "ETH,USD");
        req._addInt("multiplier", 10 ** 18);

        _sendOperatorRequest(req, fee);
    }

    uint256 public response;

    function fulfill(
        bytes32 requestId,
        uint256 data
    ) public recordChainlinkFulfillment(requestId) {
        response = data;
    }
}
