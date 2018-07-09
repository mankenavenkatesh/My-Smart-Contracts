pragma solidity ^0.4.24;

contract GolfChallenge {
    
    address private owner = msg.sender;
    address private A;
    uint private blockHeightLastExecution;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    modifier onlyIfNext105Block() {
        require(blockHeightLastExecution==0 || ((block.number) - (blockHeightLastExecution) >= 5));
        _;
    }

    function () onlyOwner external payable{
    }

    function setA(address _A) external onlyOwner {
        A = _A;
    }

    function disburse() external onlyIfNext105Block {
        uint X;
        uint temp2 = blockHeightLastExecution;
        if(temp2 == 0){
            X = 5;
        }else{
            X = (temp2+1) % 100;
        }
        blockHeightLastExecution = block.number;
        
        if (X != 0) {
            uint valueToDisburse =  X * ((address(this).balance))/(100);
            A.transfer(valueToDisburse);
        }
    }
}
