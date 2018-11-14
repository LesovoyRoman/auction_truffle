pragma solidity ^0.4.25;

contract Ping {
    uint256 value;

    function returnDoubledValue() public payable returns(uint256) {
        value == 0 ? value = 1 : value = value;
        value = value * 2;
        return value;
    }
}


contract Pong is Ping {
    Ping png;
    uint256 valueGot;

    function callFuncPing(address _pingAddress) public view returns (uint256) {
        png = Ping(_pingAddress);
        valueGot = png.returnDoubledValue();
        return valueGot;
    }
}