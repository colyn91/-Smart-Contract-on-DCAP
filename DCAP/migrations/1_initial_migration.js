var Migrations = artifacts.require("./Migrations.sol");
var DCAP = artifacts.require("./DCAP.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(DCAP);
};
