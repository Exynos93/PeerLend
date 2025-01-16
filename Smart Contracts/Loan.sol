// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./interfaces/ILoan.sol";
import "./utils/Oracle.sol";

contract Loan is ILoan {
    address public lender;
    address public borrower;
    address public collateralToken;
    uint256 public collateralAmount;
    address public loanToken;
    uint256 public loanAmount;
    uint256 public interestRate;
    uint256 public startDate;
    uint256 public duration;
    uint256 public lastInterestAccruedTimestamp;
    
    Oracle public oracle;

    constructor(
        address _lender,
        address _borrower,
        address _collateralToken,
        uint256 _collateralAmount,
        address _loanToken,
        uint256 _loanAmount,
        uint256 _interestRate,
        uint256 _duration,
        address _oracleAddress
    ) {
        lender = _lender;
        borrower = _borrower;
        collateralToken = _collateralToken;
        collateralAmount = _collateralAmount;
        loanToken = _loanToken;
        loanAmount = _loanAmount;
        interestRate = _interestRate;
        startDate = block.timestamp;
        duration = _duration;
        oracle = Oracle(_oracleAddress);
        lastInterestAccruedTimestamp = block.timestamp;
    }

    function repay(uint256 _amount) external {
        require(msg.sender == borrower, "Only borrower can repay");
        require(block.timestamp <= startDate + duration, "Loan term has expired");
        
        uint256 accruedInterest = calculateInterest();
        uint256 totalDue = loanAmount + accruedInterest;

        if (_amount >= totalDue) {
            uint256 refund = _amount - totalDue;
            IERC20(loanToken).transferFrom(msg.sender, address(this), totalDue);
            IERC20(loanToken).transfer(lender, loanAmount);
            IERC20(loanToken).transfer(borrower, refund);

            // Return collateral to borrower
            IERC20(collateralToken).transfer(borrower, collateralAmount);
            emit LoanRepaid(borrower, loanToken, totalDue);
        } else {
            // Partial repayment logic
        }
    }

    function calculateInterest() public view returns (uint256) {
        uint256 timeElapsed = block.timestamp - lastInterestAccruedTimestamp;
        return (loanAmount * interestRate * timeElapsed) / (365 days * 100);
    }

    // Additional functions for loan management, liquidation, etc.
}
