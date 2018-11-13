pragma solidity ^0.4.24;

contract BasicInfo {

    address creator;

    constructor() public {
        creator = msg.sender;
    }

    function getCurrentMinerAddress() public constant returns (address) {
        return block.coinbase;
    }

    function getCurrentDifficulty() public constant returns (uint) {
        return block.difficulty;
    }

    function getCurrentGasLimit() public constant returns (uint) {
        return block.gaslimit;
    }

      function getBlockTimestamp() constant returns (uint) // returns current block timestamp in SECONDS (not ms) from epoch
    {
    	return block.timestamp; 						 // also "now" == "block.timestamp", as in "return now;"
    }

    function getMsgData() public constant returns (bytes) {
        return msg.data;
    }

    function getMsgSender() public constant returns (address) // Returns the address of whomever made this call
    {
        return msg.sender;
    }

    function getMsgValue() public constant returns (uint) // returns amt of wei sent with this call
    {
        return msg.value;
    }

    /***  A note about gas and gasprice:

     Every transaction must specify a quantity of "gas" that it is willing to consume (called startgas),
     and the fee that it is willing to pay per unit gas (gasprice). At the start of execution,
     startgas * gasprice ether are removed from the transaction sender's account.
     Whatever is not used is immediately refunded.

     */

     function getMsgGas() public constant returns (uint) {
         return msg.gas;
     }

     function getTxGasPrise() public constant returns (uint) // "gasprice" is the amount of gas the sender was *willing* to pay. 50000000 for me. (geth default)
     {
         return tx.gasprice;
     }

     function getTxOrigin() public constant returns (address) // returns sender of the transaction
    {
        return tx.origin;
    }

    function getContractBalance() public constant returns (uint) {
        return this.balance;
    }

    function getContractAddress() public constant returns (address) {
        return this;
    }
}