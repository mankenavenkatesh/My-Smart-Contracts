var MultiSig = artifacts.require("MultiSig")

contract ("MultiSig" , async (accounts) => {
  let addressA = accounts[0];
  let instance = MultiSig.deployed();
  it("check owner", async () => {
    let owner = await instance.owner.call();
    assert.equal(owner, accounts[0]);
  })

  it("check if contributions are accepted", async() => {
    let balanceBeforeContribution = web3.fromWei(web3.eth.getBalance(instance.address), "ether");
      await instance.sendTransaction({
        value : web3.toWei(2, "ether"),
        from : addressA,
        gas : 300000
      });
     let balanceAfterContribution = web3.fromWei(web3.eth.getBalance(instance.address), "ether");
     assert.equal(balanceAfterContribution.toNumber(),2 + balanceBeforeContribution.toNumber());
  })

  it("Cannot Submit Contributions After Contribution Period Ends", async () => {
    await instance.endContributionPeriod({from : addressA});
    await instance.sendTransaction({
      value : web3.toWei(2, "ether"),
      from : addressA,
      gas : 300000
    });
  })

})
