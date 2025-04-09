// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Increment {
    uint256 public counter;

    function increment() external {
        counter++;
    }

    function check() public pure returns (bool) {
        return true;
    }
}
