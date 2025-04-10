// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {CronInbox, FunctionCall, Cronjob} from "../src/CronInbox.sol";
import {Increment} from "../src/Increment.sol";

contract CreateCronJobScript is Script {
    function run() public {
        vm.startBroadcast();

        // the address that our cronjob will call to check if the cronjob is executable
        // and the address that our cronjob will call to execute the cronjob
        address incrementContract = address(0xA4372A1514457AaD0142368fCeeBF15403c7dC74); // replace this with the address deployed by Increment.s.sol

        CronInbox cronInbox = CronInbox(0x616C37A4Fc6008714907Acdb465a2D79c786B6EA); // replace this with the address deployed by CronInbox.s.sol

        FunctionCall[] memory functionCalls = new FunctionCall[](1);
        functionCalls[0] = FunctionCall(abi.encodeWithSelector(Increment.increment.selector), incrementContract, 0);

        // create a new cronjob
        cronInbox.schedule(
            Cronjob(
                block.timestamp,
                FunctionCall(abi.encodeWithSelector(Increment.check.selector), incrementContract, 0),
                block.timestamp + 1 hours,
                msg.sender,
                functionCalls
            )
        );

        vm.stopBroadcast();
    }
}
