var QuoteRegistry = artifacts.require("QuoteRegistry");

contract("QuoteRegistry", async (accounts)=>{
    it("Validating Ownership of QuoteRegistry", async () => {
        let instance = await QuoteRegistry.deployed();
        let owner = await instance.owner.call();
        assert.equal(owner, accounts[0]);
    })

})