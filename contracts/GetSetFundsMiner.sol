pragma solidity ^0.4.24;

contract GetSetFundsMiner {

    address creator;
    address miner;
    uint256[3] values;

    constructor() public {
        creator = msg.sender;
    }

    function setMiner() notCreator public payable returns (address) {
        miner = msg.sender;
        return miner;
    }

    modifier minerNotNull() {
        require(address(miner) != 0, "Miner not set.");
        _;
    }

    modifier fundsNotNull() {
        require(msg.value >= 1 wei, "Value less than 1 wei.");
        _;
    }

    modifier enoughFunds() {
        require(msg.sender.balance > msg.value, "Balance should be at least doubled more than value + some gas.");
        _;
    }

    modifier notCreator() {
        require(creator != msg.sender, "Creator can not be the miner.");
        _;
    }

    modifier setValues() {
        values[0] = msg.value / 1000000000000000000; // ether
        values[1] = msg.value + msg.sender.balance // ether, balance before transaction
    	values[2] = msg.sender.balance / 1000000000000000000; // ether, balance after transaction
    	_;
    }

    function getMinerFunds() minerNotNull public view returns (uint256) {
        return miner.balance;
    }

    function getValues() public view returns (uint256[3]){
        return values;
    }

    // set new modifier with setting the values.
    function sendFundsToMiner() minerNotNull fundsNotNull enoughFunds setValues public payable {
    	miner.transfer(msg.value); // send funds to miner
    }
}