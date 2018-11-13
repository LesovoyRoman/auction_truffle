pragma solidity ^0.4.24;

contract Iterator {

    address public creator;
    uint8[10] integers;

    constructor() public {
        creator = msg.sender;
        uint8 x = 0;
        while(x < integers.length) {
            integers[x] = x;
            x++;
        }
    }

    function getSum() public view returns (uint256) {
        require(msg.sender == creator, "Unathorized.");
        uint8 x = 0;
        uint256 sum = 0;
        while(x < integers.length) {
            sum += integers[x];
            x++;
        }

        return sum;
    }

}