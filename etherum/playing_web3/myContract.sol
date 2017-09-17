pragma solidity ^0.4.16;

contract MyContract {
    address creator;
    uint myNumber;
    
    function MyContract() {
        creator = msg.sender;
        myNumber = 3;
    }
    
    function getCreator() constant returns (address) {
        return creator;
    }
    
    function getMyNumber() constant returns (uint) {
        return myNumber;
    }
    
    function setNewNumber(uint256 newNumber) {
        myNumber = newNumber;
    }
    
    function kill(){
        if(msg.sender == creator){
            suicide(creator);
        }
    }
}