// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
onstructor() ERC20("LendToken", "LDT") {
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
  }
}
