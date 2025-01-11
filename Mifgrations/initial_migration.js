const LendingPool = artifacts.require("LendingPool");
const Loan = artifacts.require("Loan");
const Oracle = artifacts.require("Oracle");
const Token = artifacts.require("Token");

module.exports = function(deployer) {
  deployer.deploy(Token).then(() => {
    return deployer.deploy(Oracle).then(() => {
      return deployer.deploy(LendingPool, Token.address, Oracle.address);
    });
  });
};
