//https://api.nasa.gov/neo/rest/v1/feed?start_date=START_DATE&end_date=END_DATE&api_key=API_KEY

// SPDX-License-Identifier: MIT
//Indicar la version
pragma solidity >=0.4.4 <0.9.0;
pragma experimental ABIEncoderV2;

contract Oracle {
    address owner;

    uint256 public numberAsteroids;

    event __callbackNewData();

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner");
        _;
    }

    function update() public onlyOwner {
        emit __callbackNewData();
    }

    function setNumberAsteroids(uint256 _num) public onlyOwner {
        numberAsteroids = _num;
    }
}
