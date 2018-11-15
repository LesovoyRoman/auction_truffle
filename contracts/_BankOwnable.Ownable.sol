pragma solidity ^0.4.25;

contract Ownable {
    address new_address_set;
    address public owner;

    constructor() payable {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        //require(msg.sender != new_address_set);
        _;
    }

    // check if account which is set to be new owner
    modifier onlyNewAddress(){
        require(msg.sender == new_address_set);
        _;
    }

    // prepare to set new address
    function setAnotherOwner(address new_address) onlyOwner {
        new_address_set = new_address;
    }

    // accepting the status of new owner
    // possible only from account which is set
    function acceptNewAddress() onlyNewAddress {
        owner = new_address_set;
    }
}