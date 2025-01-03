//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "./interfaces/ILendingPool.sol";
import "./utils/Oracle.sol";
import "./tokens/Token.sol";

contract LendingPool is Pausable, AccessControl, ILendingPool {
    bytes32 public constant GOVERNOR_ROLE = keccak256("GOVERNOR_ROLE");

    mapping(address => uint256) public balances;
    mapping(address => uint256) public borrowed;
    Oracle public oracle;
    Token public token;

    
