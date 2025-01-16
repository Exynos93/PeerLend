const Governance = artifacts.require("Governance");

module.exports = async function (deployer) {
  const lendingPool = await LendingPool.deployed();
  await deployer.deploy(Governance, lendingPool.address);
};
