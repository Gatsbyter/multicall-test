// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.20;

contract Multicall {
    struct Call {
        address target;
        bytes callData;
    }

    function aggregate(Call[] calldata calls) public returns (bytes[] memory returnData) {
        returnData = new bytes[](calls.length);
        for (uint256 i = 0; i < calls.length; i++) {
            (bool success, bytes memory ret) = calls[i].target.delegatecall(abi.encodePacked(calls[i].callData, msg.sender));
            require(success);
            returnData[i] = ret;
        }
    }
}
