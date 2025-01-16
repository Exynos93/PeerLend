const LendingPool = artifacts.require("LendingPool");
const Loan = artifacts.require("Loan");

module.exports = async function (deployer) {
  const token = await Token.deployed();
  const stableCoin = await StableCoin.deployed();
  const oracle = await Oracle.deployed();
  const riskAssessment = await RiskAssessment.deployed();

  await deployer.deploy(LendingPool, oracle.address, riskAssessment.address, token.address);
  await deployer.deploy(Loan, /* constructor params */);
};
