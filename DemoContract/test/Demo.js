const Demo = artifacts.require('Demo');
contract('Demo' , function(accounts){
    it('change name to new owner', async () => {
        let instance = await Demo.deployed();
        await instance.changeName("venky");
        let name = await instance.getName.call();
        assert.equal(name, "venky");
    })
})