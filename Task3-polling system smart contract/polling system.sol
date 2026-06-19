// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PollingSystem {

    struct Poll {
        string title;
        string[] options;
        uint256 endTime;

        // Stores vote count for each option
        mapping(uint256 => uint256) voteCount;

        // Stores whether an address has voted
        mapping(address => bool) hasVoted;
    }

    // Store all polls
    Poll[] public polls;


    // Create a new poll
    function createPoll(
        string memory _title,
        string[] memory _options,
        uint256 _duration
    ) public {

        require(_options.length > 1, "Need at least two options");

        Poll storage newPoll = polls.push();

        newPoll.title = _title;
        newPoll.options = _options;

        // Deadline based on seconds
        newPoll.endTime = block.timestamp + _duration;
    }


    // Vote for an option
    function vote(
        uint256 _pollId,
        uint256 _optionIndex
    ) public {

        Poll storage poll = polls[_pollId];

        require(
            block.timestamp < poll.endTime,
            "Poll has ended"
        );

        require(
            !poll.hasVoted[msg.sender],
            "Already voted"
        );

        require(
            _optionIndex < poll.options.length,
            "Invalid option"
        );


        poll.voteCount[_optionIndex]++;

        poll.hasVoted[msg.sender] = true;
    }


    // Get vote count of an option
    function getVotes(
        uint256 _pollId,
        uint256 _optionIndex
    ) public view returns(uint256){

        Poll storage poll = polls[_pollId];

        return poll.voteCount[_optionIndex];
    }


    // Find winning option after poll ends
    function getWinner(
        uint256 _pollId
    ) public view returns(string memory){

        Poll storage poll = polls[_pollId];

        require(
            block.timestamp >= poll.endTime,
            "Poll is still active"
        );


        uint256 winningIndex = 0;
        uint256 highestVotes = 0;


        for(uint256 i = 0; i < poll.options.length; i++){

            if(poll.voteCount[i] > highestVotes){

                highestVotes = poll.voteCount[i];
                winningIndex = i;
            }
        }


        return poll.options[winningIndex];
    }


    // Get poll details
    function getPoll(
        uint256 _pollId
    )
    public
    view
    returns(
        string memory,
        string[] memory,
        uint256
    ){

        Poll storage poll = polls[_pollId];

        return(
            poll.title,
            poll.options,
            poll.endTime
        );
    }
}
