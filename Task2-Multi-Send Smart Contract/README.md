# Multi-Send Smart Contract

## Description

A Solidity smart contract that accepts an array of Ethereum addresses and distributes Ether equally among them. The contract includes a payable function that receives Ether and sends an equal share to each recipient using a loop. It also ensures safe transfers by checking transaction success.

## Features

- Accepts an array of Ethereum addresses
- Receives Ether using a payable function
- Splits Ether equally among all recipients
- Uses a loop for distribution
- Ensures successful transfers using require checks
- Tested and deployed using Remix IDE

## Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MultiSend {

    // Function to distribute Ether equally among recipients
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

    // Function to check contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
```

## Testing

| Action | Result |
|--------|--------|
| Deploy Contract | Success |
| Call distributeEther() | Ether distributed equally |
| Call getBalance() | 0 after distribution |

## Example Usage (Remix)

- Input addresses:
  ```
  ["0xAddress1", "0xAddress2"]
  ```

- Value:
  ```
  2 ether
  ```

- Result:
  - Each address receives 1 ETH

## Technologies Used

- Solidity (^0.8.20)
- Remix IDE
- Ethereum Virtual Machine (EVM)

## Author

B. Mano Varaha Vinay
