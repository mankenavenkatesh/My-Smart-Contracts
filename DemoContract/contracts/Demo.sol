pragma solidity ^0.4.18;

contract Demo {
    string public name;

    function changeName(string _newName) public {
        name = _newName;
    }    

    function getName() public view returns(string) {
        return name;
    }
}