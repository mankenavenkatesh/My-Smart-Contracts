pragma solidity ^0.4.24;

contract QuoteRegistry {

    address public owner;
    mapping(string => address) quoteOwners;

    constructor() public {
        owner = msg.sender;
    }

    function register(string _quote) public { 
        require(quoteOwners[_quote] == 0x0000000000000000000000000000000000000000);        
        quoteOwners[_quote] = msg.sender;
    }

    function ownership(string _quote) public view returns (address) {
        return quoteOwners[_quote];
    }

    function transfer(string _quote, address _newOwner) public payable {
        require(quoteOwners[_quote] == msg.sender);
        require(msg.value >= 0.5 ether);
        address oldOwner = quoteOwners[_quote];        
        quoteOwners[_quote] = _newOwner;
        oldOwner.transfer(0.5 ether);
    }
}



