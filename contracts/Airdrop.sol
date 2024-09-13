// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.20;

import "hardhat/console.sol";

contract Airdrop {

    mapping(address => bool) public whitelist;

    function airdrop() external view {
        console.log("call from %s", msg.sender);
        require(whitelist[msg.sender], "not in whitelist");
    }

    function setWhitelist(address user) external {
        whitelist[user] = true;
    }
}
