const Oracle = artifacts.require("Oracle");
const RiskAssessment = artifacts.require("RiskAssessment");

module.exports = async function (deployer) {
  const oracle = await deployer.deploy(Oracle);
  await deployer.deploy(RiskAssessment);
  
  // Example: Setting up price feeds for tokens
  const token = await Token.deployed();
  const stableCoin = await StableCoin.deployed();
  await oracle.setPriceFeed(token.address, "0x..."); // Chainlink ETH/USD feed or similar
  await oracle.setPriceFeed(stableCoin.address, "0x..."); // Chainlink USDC/USD feed or similar

  // Set initial collateral ratios
  const riskAssessment = await RiskAssessment.deployed();
  await riskAssessment.setCollateralRatio(token.address, 150); // 150% collateral ratio for ETH
  await riskAssessment.setCollateralRatio(stableCoin.address, 110); // 110% for stablecoin
};
