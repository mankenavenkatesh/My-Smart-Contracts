pragma solidity ^0.4.24;

contract QuoteRegistry {
    
    address public owner;

    constructor() public {
        owner = msg.sender;
    }
}



