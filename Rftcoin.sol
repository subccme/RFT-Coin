// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract RFT {
    // Initialize variables
    uint256 public totalSupply = 1000000;
    uint256 public balanceOf;
    mapping(address => uint256) public balances;
    address public owner;

    // Set the owner of the contract to the address that deployed it
    constructor() {
        owner = msg.sender;
    }

    // Transfer the specified amount of RFT from the sender to the recipient
    function transfer(address recipient, uint256 amount) public {
        // Ensure that the sender has enough RFT to send
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Subtract the amount from the sender's balance
        balances[msg.sender] -= amount;

        // Add the amount to the recipient's balance
        balances[recipient] += amount;
    }

    // Check the balance of the specified address
    function checkBalance(address account) public view returns (uint256) {
        return balances[account];
    }
}
