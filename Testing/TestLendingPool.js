const LendingPool = artifacts.require("LendingPool");
const Token = artifacts.require("Token");

contract("LendingPool", accounts => {
  let lendingPool, token;

  beforeEach(async () => {
    token = await Token.deployed();
    lendingPool = await LendingPool.deployed(token.address);
  });

  it("should deposit tokens", async () => {
    await token.approve(lendingPool.address, 100);
    await lendingPool.deposit(100);
    let balance = await lendingPool.balances(accounts[0]);
    assert.equal(balance.toNumber(), 100);
  });

  // Add more tests for borrow, repay, and withdraw functions
});
