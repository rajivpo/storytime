pragma solidity ^0.8.6;

contract Book {
    string[] public story;
    mapping(address => bool) public authors;

    event StoryExtended(address indexed author, string words);

    constructor() {
        // Iconic start for a story
        story.push("Once upon a time");
    }

    function extendStory(string memory words) public {
        // yah this isn't a good way of doin dis
        require(bytes(words).length <= 300, "Cannot add more than 300 characters at a time");
        story.push(words);
        authors[msg.sender] = true;
        emit StoryExtended(msg.sender, words);
    }

    function read() external view returns (string memory fullStory) {
        for (uint i = 0; i < story.length; i++) {
            if (i == 0){
                fullStory = story[i];
            } else {
                fullStory = string(abi.encodePacked(fullStory, ' ', story[i]));
            }
        }
        return fullStory;
    }
    
}
