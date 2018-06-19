var QuoteRegistry = artifacts.require("QuoteRegistry");

contract("QuoteRegistry", async (accounts)=>{
    it("Change  Contract Owner of QuoteRegistry", async () => {
        let instance = await QuoteRegistry.deployed();
        await instance.changeContractOwner("venky");
        let newOwner = await instance.getContractOwner.call();
        assert.equal(newOwner, "venky");
    })

    it("Validating Ownership of QuoteRegistry", async () => {
        let instance = await QuoteRegistry.deployed();
        let owner = instance.owner.call();
        assert.equal(owner, accounts[0]);
    })
})