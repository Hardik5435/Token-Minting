// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20 {
    constructor() ERC20("Hardikk","HARI") {
        _mint(msg.sender, 1000 * 10**3);  // Mint 1000 tokens to the contract deployer
    }

    // Function to mint new tokens, callable only by the owner
        function mint(address to, uint256 amount) public  {
        _mint(to, amount);
    }

    function sendFunds(address , uint _amount) public payable{
        require(balanceOf(msg.sender)> _amount, "unsufficient funds to transfer");
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(balanceOf(msg.sender) >= amount, "Insufficient funds to transfer");
        _transfer(msg.sender, recipient, amount);
        return true;
    }
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
