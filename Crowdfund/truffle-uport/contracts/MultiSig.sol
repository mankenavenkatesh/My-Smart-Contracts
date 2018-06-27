pragma solidity ^0.4.20;
/* import "../homework/Abs" */
contract MultiSig {
  address public owner;
  bool private contributionPeriodEnd;
  mapping (address => uint) contributionsMap;


  constructor () {
    owner = msg.sender;
    contributionPeriodEnd = false;
  }

  /* event ReceivedContribution(address indexed _contributor, uint valueInWei); */

  modifier isContributionNotEnd() {
    require(contributionPeriodEnd == false);
    _;
  }

function owner() external returns(address){
  return owner;
}

  function () payable isContributionNotEnd {
  }

  function endContributionPeriod() external {
    contributionPeriodEnd == true;
  }

  /* function listContributors() external view returns (address[]); */
  /* function getContributorAmount(address _contributor) external view returns (uint); */


}
