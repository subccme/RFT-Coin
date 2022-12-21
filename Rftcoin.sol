pragma solidity ^0.8.0;

// This is the contract for the RFT coin
// It has a total supply of 1,000,000 tokens
contract RFT {
  // The total supply of RFT tokens
  uint256 public totalSupply = 1000000;

  // The balance of each address
  mapping(address => uint256) public balances;

  // The name of the token
  string public name = "RFT";

  // The symbol of the token
  string public symbol = "RFT";

  // The number of decimals of the token
  uint8 public decimals = 8;

  // The constructor of the contract
  // It initializes the total supply of RFT tokens
  // and assigns all of them to the contract owner
  constructor() public {
    balances[msg.sender] = totalSupply;
  }

  // This function allows the contract owner to transfer
  // RFT tokens to another address
  function transfer(address _to, uint256 _value) public {
    require(balances[msg.sender] >= _value, "Insufficient balance");
    balances[msg.sender] -= _value;
    balances[_to] += _value;
  }
  
 // Function to allow the owner to withdraw funds from the contract's address to a liquidity pool
    function withdrawToPool(address _poolAddress) public {
        require(msg.sender == owner, "Only the owner can withdraw funds from the contract's address");
        require(_poolAddress != address(0), "Invalid pool address.");
        require(this.balance > 0, "There are no funds to withdraw.");
        _poolAddress.transfer(this.balance);
    }
}

