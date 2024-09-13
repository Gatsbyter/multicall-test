// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.20;

import "hardhat/console.sol";

contract Airdrop {
    function airdrop() external view {
        console.log(
            "call from %s",
            msg.sender
        );
    }
}
