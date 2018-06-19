# QuoteRegistry - Ownership of Quotes.
``` 
Quote Registry, a smart contract that will keep a list of quotes and their ownership (Ex: “I have no special talent. I am only passionately curious.” – Einstein). Instead of the author's name, as in the example, the ownership should be an address. 

This smart contract should have three public functions: 
- One to register a quote. The ownership of the quote will be, of course, whoever sent the transaction to register the quote. 
- Another function that will return the ownership (address) of a given quote. 
- Finally, it should have a function to transfer ownership of a quote to someone else.

To transfer ownership, a fee of 0.5 Ether should be paid. If this fee is not paid when calling the transfer function, the ownership should not be transferred. The fee should be forwarded to the old owner of the Quote.

Additionally, your contract should also provide a function that will return the owner of the contract, i.e, your address.
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


