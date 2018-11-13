pragma solidity ^0.4.24;

contract BalanceChecker {

    address creator;
    uint256 startBalance;

    constructor() public {
        creator = msg.sender;
        startBalance = creator.balance;
    }

    function getContractAddress() public constant returns (address) {
        return this;
    }

    function getStartBalance() public constant returns (uint256) {
        return startBalance;
    }

    function getCurrentBalance() public constant returns (uint256) {
        return creator.balance;
    }
}