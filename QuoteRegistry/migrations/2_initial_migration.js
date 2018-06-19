var QuoteRegistry = artifacts.require("QuoteRegistry");

module.exports = function(deployer) {
  deployer.deploy(QuoteRegistry);
};
