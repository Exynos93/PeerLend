// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiskAssessment {
    mapping(address => uint256) public collateralRatios; // Token address to required collateral ratio

    function setCollateralRatio(address _token, uint256 _ratio) public {
        collateralRatios[_token] = _ratio;
    }

    function getRequiredCollateralRatio(address _token) public view returns (uint256) {
        return collateralRatios[_token];
    }
}
