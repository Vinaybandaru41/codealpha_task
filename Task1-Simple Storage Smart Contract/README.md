# Simple Storage Smart Contract

## Description

A simple Solidity smart contract that stores an integer value and allows users to increment or decrement the value. The contract provides public access to read the current stored value and demonstrates basic state variable management and function implementation in Solidity.

## Features

- Store an integer value on the blockchain
- Increment the value by 1
- Decrement the value by 1
- Read the current value
- Compiled, deployed, and tested using Remix IDE

## Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    int public value;

    function increment() public {
        value += 1;
    }

    function decrement() public {
        value -= 1;
    }

    function getValue() public view returns (int) {
        return value;
    }
}
```

## Testing

| Action | Output |
|--------|--------|
| Deploy Contract | 0 |
| increment() | 1 |
| increment() | 2 |
| decrement() | 1 |

## Technologies Used

- Solidity
- Remix IDE
- Ethereum Virtual Machine (EVM)

## Author

B. Mano Varaha Vinay
