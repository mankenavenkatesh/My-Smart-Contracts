pragma solidity ^0.4.24;

contract QuoteRegistry {

    string public contractOwner;
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function changeContractOwner(string _newOwner) public {
        contractOwner = _newOwner;
    }

    function getContractOwner() public view returns (string) {
        return contractOwner;
    }
}



