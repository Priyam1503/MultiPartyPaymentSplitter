// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiPartyPaymentSplitter {

    // Array to store the addresses of recipients
    address[] public recipients;

    // Function to add recipients
    function addRecipient(address _recipient) public {
        recipients.push(_recipient);
    }

    // Function to split incoming payments among recipients
    function splitPayment() public payable {
        uint256 amountPerRecipient = msg.value / recipients.length;
        
        // Ensure there's no remainder
        require(amountPerRecipient > 0, "Insufficient funds to split");

        // Send the calculated amount to each recipient
        for (uint256 i = 0; i < recipients.length; i++) {
            payable(recipients[i]).transfer(amountPerRecipient);
        }
    }

    // Function to get the number of recipients
    function getRecipientCount() public view returns (uint256) {
        return recipients.length;
    }
}
