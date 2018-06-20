var QuoteRegistry = artifacts.require("QuoteRegistry");

contract("QuoteRegistry", async (accounts)=>{
    let contractOwner = accounts[0];
    let addressA = accounts[1];
    let addressB = accounts[2];
    let addressC = accounts[3];

    it("Validating smartcontract Ownership", async () => {
        let instance = await QuoteRegistry.deployed();
        let owner = await instance.owner.call();
        assert.equal(owner, accounts[0]);
    })

    it("registering and validating quote ownership", async ()=> {                      
        let instance = await QuoteRegistry.deployed();
        await instance.register("some fun quote", {from : addressA});
        let quoteOwner = await instance.ownership("some fun quote");
        assert.equal(quoteOwner, accounts[1]);
    })

    it("transfering quote ownership", async ()=> {
        let instance = await QuoteRegistry.deployed();
        await instance.register("some fun quote", {from : addressA});
        let balancebeforeTransfer = web3.fromWei(web3.eth.getBalance(addressA), 'ether');        
        await instance.transfer("some fun quote", addressB, {from : addressC, value : web3.toWei(0.5,"ether")});
        let balanceAfterTransfer = web3.fromWei(web3.eth.getBalance(addressA), 'ether');        
        assert.equal(balanceAfterTransfer.toNumber(), balancebeforeTransfer.toNumber()+0.5 );
        let quoteOwner = await instance.ownership("some fun quote");
        assert.equal(quoteOwner, addressB);
    })

    it("homework test cases", async () => {
        let instance = await QuoteRegistry.deployed();
        await instance.register("some fun quote", {from : addressA});
        await instance.register("some very serious quote", {from : addressB});
        await instance.register("just another quote", {from : addressA});
        let q1Owner = await instance.ownership("some fun quote");
        assert.equal(q1Owner, addressA);
        let q2Owner = await instance.ownership("some very serious quote");
        assert.equal(q2Owner, addressB);
        let q3Owner = await instance.ownership("just another quote");
        assert.equal(q3Owner, addressA);
        try {
            await instance.transfer("just another quote", addressB, {from: addressC});
        }
        catch(error){

        }        
        assert.equal(q3Owner, addressA);
        let balancebeforeTransfer = web3.fromWei(web3.eth.getBalance(addressA), 'ether').toNumber();
        await instance.transfer("just another quote", addressB, {from: addressC, value : web3.toWei(0.5, "ether")});
        q3Owner = await instance.ownership("just another quote");
        assert.equal(q3Owner, addressB);
        let balanceAfterTransfer = web3.fromWei(web3.eth.getBalance(addressA), 'ether').toNumber();
        assert.equal(balanceAfterTransfer, balancebeforeTransfer + 0.5);
    })

})

