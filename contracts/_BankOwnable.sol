pragma solidity ^0.4.25;

contract Ownable {
    address new_address_set;
    address public owner;

    constructor() public payable {
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
    function setAnotherOwner(address new_address) public onlyOwner {
        new_address_set = new_address;
    }

    // accepting the status of new owner
    // possible only from account which is set
    function acceptNewAddress() public onlyNewAddress {
        owner = new_address_set;
    }
}

contract Destructible is Ownable {
    constructor() public payable {}

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }

    function destroyAndSend(address _recipient) public onlyOwner {
        selfdestruct(_recipient);
    }
}

contract BankAccount is Ownable, Destructible {
    modifier enoughFunds() {
        require(msg.sender.balance > msg.value);
        _;
    }

    // store money
    function store() public payable enoughFunds {}

    // get money back
    function withdraw(uint amount) public onlyOwner {
        require(address(this).balance >= amount);
        msg.sender.transfer(amount);
    }
}