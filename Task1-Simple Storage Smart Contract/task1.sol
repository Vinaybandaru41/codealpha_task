// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {

    // State variable to store the value
    int public value;

    // Increment the value by 1
    function increment() public {
        value += 1;
    }

    // Decrement the value by 1
    function decrement() public {
        value -= 1;
    }

    // Read the current value
    function getValue() public view returns (int) {
        return value;
    }
}
    