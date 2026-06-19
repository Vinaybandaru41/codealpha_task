Polling System Smart Contract
📌 Project Overview

The Polling System Smart Contract is a decentralized voting application built using Solidity and deployed on the blockchain. This project enables users to create polls, add multiple voting options, cast votes securely, and determine the winning option after the voting period ends.

The smart contract eliminates the need for a centralized voting authority by using blockchain technology to provide a transparent, secure, and tamper-proof voting process.

🎯 Objective

The main objective of this project is to develop a secure polling system where:

Users can create polls with multiple options.
Each poll has a fixed voting deadline.
Users can vote only once.
Votes are stored securely using blockchain mappings.
The winning option is automatically calculated after the poll ends.
🚀 Features
1. Create Polls
Users can create a new poll by providing:
Poll title
List of options
Voting duration/deadline
2. Poll Structure

A Solidity struct is used to store poll information:

Title – Name or question of the poll
Options – Available choices for voting
End Time – Voting closing timestamp
Vote Count – Stores votes received by each option using mappings

Example:

struct Poll {
    string title;
    string[] options;
    uint endTime;
    mapping(uint => uint) voteCount;
}
🗳️ Voting System

Users can vote for their preferred option before the deadline.

The contract checks:

Whether the poll is still active.
Whether the user has already voted.

A mapping is used to prevent multiple votes:

mapping(address => bool) hasVoted;

Each wallet address is allowed to vote only once.

⏳ Time-Based Restriction

The smart contract uses blockchain timestamps to control voting access.

Voting is allowed only before the deadline:

block.timestamp < endTime

After the deadline, the contract rejects new votes.

🔐 Secure Vote Storage

Votes are stored using mappings:

mapping(uint => uint) voteCount;

Each option maintains its own vote count, ensuring accurate and secure vote tracking.

Example:

Option A → 15 votes
Option B → 30 votes
Option C → 10 votes
🏆 Winner Calculation

After the voting period ends, the smart contract compares all option vote counts.

The winner function:

Checks whether voting is completed.
Finds the option with the highest votes.
Returns the winning option.

Example:

function getWinner(uint pollId)
public view returns(string memory)
🛠️ Technologies Used
Solidity – Smart contract development language
Ethereum Blockchain – Decentralized execution platform
Remix IDE – Smart contract testing and deployment
Mappings – Secure data storage
Structs – Store poll information
📂 Project Workflow
Create Poll
     ↓
Store Poll Details
     ↓
Users Cast Votes
     ↓
Prevent Duplicate Voting
     ↓
Voting Deadline Reached
     ↓
Calculate Winner
✅ Advantages
Secure and transparent voting
Prevents duplicate votes
No centralized control
Automatic winner selection
Blockchain-based trust system
Immutable vote records
🔮 Future Enhancements
Add user authentication
Develop a frontend using Web3
Display real-time voting results
Support multiple active polls
Add admin management features
