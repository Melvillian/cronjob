// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Increment} from "../src/Increment.sol";

contract IncrementScript is Script {
    Increment public increment;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        increment = new Increment();
        vm.stopBroadcast();
    }
}
