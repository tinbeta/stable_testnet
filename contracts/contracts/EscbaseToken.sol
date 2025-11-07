// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EscbaseToken is ERC20, Ownable {
	constructor() ERC20("Escbase","ESC") Ownable(msg.sender) {}

	function mint(address to, uint256 amount) external onlyOwner {
		_mint(to, amount);
	}

	// Swap gUSDT to ESC: 0.0001 gUSDT = 10 ESC
	// Rate: ESC_amount = gUSDT_amount_wei * 100000
	function swap() external payable {
		require(msg.value > 0, "Must send gUSDT");
		uint256 escAmount = msg.value * 100000;
		_mint(msg.sender, escAmount);
	}
}


