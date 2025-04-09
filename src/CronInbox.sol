// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// Holds all the data necessary for a single Cronjob function call
struct FunctionCall {
    bytes functionCalldata; // the 4-byte function selector and ABI-encoded function args
    address recipient; // the addresses to send each function call to
    uint256 value;
} // the ETH value to send (can be 0)

// Represents an onchain cronjob, which will executed the
struct Cronjob {
    uint256 startTime; // the date to start executing the Cronjob
    FunctionCall check; // a function call that returns a boolean value true if the cronjob is executable
    uint256 endTime; // the date to stop executing the Cronjob
    address sender; // the address that created this Cronjob
    FunctionCall[] functionCalls; // the list of function calls to execute
}

contract CronInbox {
    Cronjob[] public jobs; // TODO figure out something more optimal than simple array of cronjobs (removing stale cronjobs will be O(n) and too slow)

    event CronjobAdded(Cronjob cronjob);

    function schedule(Cronjob memory cronjob) external {
        validateJob(cronjob); // TODO implement this
        jobs.push(cronjob);

        emit CronjobAdded(cronjob);
    }

    function validateJob(Cronjob memory cronjob) internal view {
        // TODO implement this
    }
}
