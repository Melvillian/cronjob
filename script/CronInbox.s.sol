// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {CronInbox} from "../src/CronInbox.sol";

contract CronInboxScript is Script {
    CronInbox public cronInbox;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        cronInbox = new CronInbox();
        vm.stopBroadcast();
    }
}
