pragma solidity ^0.4.16;
import "github.com/ethereum/solidity/std/mortal.sol";

contract MyContract is mortal {
  uint myVariable;
  
  function MyContract() payable {
    myVariable = 5;
  }
  
  function setMyVariable(uint myNewVariable) onlyowner {
    myVariable = myNewVariable;
  }
  
  function getMyVariable() constant returns (uint){
    return myVariable;  
  }
  
  function getMyContractBalace() constant returns (uint) {
    return this.balance;  
  }
  
  // anonymous function that acts when we send ether to a contract and don't specify the function
  function() payable {
      
  }
}