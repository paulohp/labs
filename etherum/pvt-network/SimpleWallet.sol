pragma solidity ^0.4.0;

import "github.com/ethereum/solidity/std/mortal.sol";

contract SimpleWallet is mortal {
    
    mapping(address => Permission) permittedAddress;
    event someoneAddedSomeoneToTheSendersList(address thePersonWhoAdded, address thePersonWhoIsAloowedNow, uint thisMuchHeCanSend);
    
    struct Permission {
        bool isAllowed;
        uint maxTransferAmount;
    }
    
    function addAddressToSendersList(address permitted, uint maxTransferAmount) onlyowner {
        permittedAddress[permitted] = Permission(true, maxTransferAmount);
        someoneAddedSomeoneToTheSendersList(msg.sender, permitted, maxTransferAmount);
    }
    
    function sendFunds(address receiver, uint amountInWei) {
        if(permittedAddress[msg.sender].isAllowed) {
            if(permittedAddress[msg.sender].maxTransferAmount >= amountInWei) {
                bool isTheAmountReallySent = receiver.send(amountInWei);
                if(!isTheAmountReallySent) {
                    throw;
                }
            } else {
                throw;
            }
        } else {
            throw;
        }
    }

    function removeAddressFromSendersList (address remove) {
        delete permittedAddress[remove];
    }
    
    function () payable {
        
    }
    
}