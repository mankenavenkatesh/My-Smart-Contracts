pragma solidity ^0.4.20;

contract GolfChallenge {
    address private owner;
    
    constructor () {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function deposit() onlyOwner {
        
    }


}