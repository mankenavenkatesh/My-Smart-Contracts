# Delegate Voting - voting contract
``` 
we will show how delegated voting can be done so that vote counting is automatic and completely transparent at the same time.
The idea is to create one contract per ballot, providing a short name for each option. Then the creator of the contract who serves as chairperson will give the right to vote to each address individually.

The persons behind the addresses can then choose to either vote themselves or to delegate their vote to a person they trust.

At the end of the voting time, winningProposal() will return the proposal with the largest number of votes.

```


Follow the steps below to run Quote Registry on Local.
## Dependencies
Install these prerequisites to follow along with the tutorial. See free video tutorial or a full explanation of each prerequisite.
- NPM: https://nodejs.org
- Truffle: https://github.com/trufflesuite/truffle
- Ganache-cli: https://www.npmjs.com/package/ganache-cli
- Metamask: https://metamask.io/

## Step 1. Clone the repository.
- clone this repo.

## Step 2. Start Ganache-cli in separate terminal
`ganache-cli`

## Step 3. Compile & Deploy Demo Smart Contract
`$ truffle migrate --reset`
You must migrate the smart contract each time your restart ganache.

## Step 4. Test Demo Smart Contract
`$ truffle test`


