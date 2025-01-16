const Token = artifacts.require("Token");
const StableCoin = artifacts.require("StableCoin");

module.exports = async function (deployer) {
  await deployer.deploy(Token);
  await deployer.deploy(StableCoin);
};
