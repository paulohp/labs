pragma solidity ^0.4.8;

contract HelloWorldSuicide {
  uint256 counter = 0;

  function increase() {
    counter++;
  }

  function decrease() {
    counter--;
  }

  function getCounter() constant returns (uint256) {
    return counter;
  }

  function killme() {
    suicide(msg.sender);
  }
}