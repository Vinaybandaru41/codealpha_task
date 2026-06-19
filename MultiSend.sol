// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MultiSend {

    function distributeEther(address payable[] calldata recipients)
        external
        payable
    {
        require(recipients.length > 0, "No recipients provided");

        uint256 amountPerRecipient = msg.value / recipients.length;

        require(amountPerRecipient > 0, "Insufficient Ether sent");

        for (uint256 i = 0; i < recipients.length; i++) {
            (bool success, ) = recipients[i].call{value: amountPerRecipient}("");
            require(success, "Transfer failed");
        }
    }

    // Check contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}