pragma solidity ^0.4.16;

contract Mortal {
    address owner;
    
    function Mortal() {
        owner = msg.sender;    
    }
    
    modifier onlyOwner() {
        if(owner == msg.sender) {
            _;
        } else {
            throw;
        }
      }
    
    function kill() onlyOwner {
        suicide(owner);
    }
}