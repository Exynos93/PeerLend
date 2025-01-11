// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Loan {
    address public lender;
    address public borrower;
    uint256 public amount;
    uint256 public interestRate;
    uint256 public endDate;

    constructor(address _lender, address _borrower, uint256 _amount, uint256 _interestRate, uint256 _duration) {
        lender = _lender;
        borrower = _borrower;
        amount = _amount;
        interestRate = _interestRate;
        endDate = block.timestamp + _duration;
    }

    function repay() public payable {
        require(msg.sender == borrower, "Only borrower can repay");
        require(block.timestamp < endDate, "Loan has expired");
        require(msg.value >= amount + (amount * interestRate / 100), "Insufficient repay amount");
        
        payable(lender).transfer(msg.value);
    }
}
