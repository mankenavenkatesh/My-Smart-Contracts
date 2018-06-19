
# Tutorial to Create Basic Smart Contract
Build your Demo Smart Contract, on the Ethereum Network with this tutorial!
Demo Smart contract will store owner of smart contract. 

Follow the steps below to create a Demo project.
## Dependencies
Install these prerequisites to follow along with the tutorial. See free video tutorial or a full explanation of each prerequisite.
- NPM: https://nodejs.org
- Truffle: https://github.com/trufflesuite/truffle
- Ganache-cli: https://www.npmjs.com/package/ganache-cli
- Metamask: https://metamask.io/

## Step 1. Create and initialize Project
- mkdir Demo
- cd Demo
- truffle init

## Step 2. Start Ganache-cli in separate terminal
`ganache-cli`

## Step 3. Modify truffle-config.js to connect to ganache-cli
```module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*"
    }
  }
}
```
## Step 4. Compile & Deploy Demo Smart Contract
Create Demo Smart contract inside contracts folder.
Add code to deploy Demo Smart contract in migrations folder and run below command.
`$ truffle migrate --reset`
You must migrate the Demo smart contract each time your restart ganache.

## Step 5. Test Demo Smart Contract
Add Your test cases in test folder and run below command.
`$ truffle test`


