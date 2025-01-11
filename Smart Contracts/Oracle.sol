// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Oracle {
    uint256 public collateralRatio = 150; // Example: 150% collateral required

    function setCollateralRatio(uint256 _collateralRatio) public {
        collateralRatio = _collateralRatio;
    }

    function getCollateralRatio() public view returns (uint256) {
        return collateralRatio;
    }
}
