// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./Oracle.sol";

contract LendingPool {
    IERC20 public token;
    Oracle public oracle;

    mapping(address => uint256) public balances;
    mapping(address => uint256) public borrowed;

    constructor(address _tokenAddress, address _oracleAddress) {
        token = IERC20(_tokenAddress);
        oracle = Oracle(_oracleAddress);
    }

    function deposit(uint256 amount) public {
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        balances[msg.sender] += amount;
    }

    function borrow(uint256 amount) public {
        uint256 collateralRequired = amount * oracle.getCollateralRatio() / 100;
        require(balances[msg.sender] >= collateralRequired, "Not enough collateral");
        require(token.transfer(msg.sender, amount), "Failed to transfer borrow amount");
        borrowed[msg.sender] += amount;
    }

    function repay(uint256 amount) public {
        require(token.transferFrom(msg.sender, address(this), amount), "Repay failed");
        require(borrowed[msg.sender] >= amount, "Repaying more than borrowed");
        borrowed[msg.sender] -= amount;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        require(borrowed[msg.sender] == 0, "Cannot withdraw with outstanding loans");
        balances[msg.sender] -= amount;
        require(token.transfer(msg.sender, amount), "Withdraw failed");
    }
}
