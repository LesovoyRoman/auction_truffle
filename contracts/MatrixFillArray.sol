pragma solidity ^0.4.25;
pragma experimental "v0.5.0";
pragma experimental ABIEncoderV2;

contract ArrayPasser {

    address creator;

    /***
     * 1. Declare a 2x2 map of tiles
     ***/
    uint8 mapsize = 2;
    Tile[2][2] tiles;

    /***
    * 2. set struct Tiles
    ***/
    struct Tile {
        uint8 value;
    }

    /***
     * 3. map array from input, set each tile
     ***/
    constructor(uint8[] incmap, address _hlp_address) public payable
    {
        creator = msg.sender;
        uint8 counter = 0;
        for(uint8 y = 0; y < mapsize; y++)
        {
            for(uint8 x = 0; x < mapsize; x++)
            {
                tiles[x][y].value = incmap[counter];
                counter = counter + 1;
            }
        }
    }

    /***
    * 4. Get tiles
    ***/
    function getElevations() public view returns (Tile[2][2]) {
        return tiles;
    }
}