pragma solidity ^0.5.16;

/* 

Keccak256 (Cryptographic Hash Function)
    - A function that takes in arbitrary size input and outputs a data of fixed size
    - Properties:
        - Deterministic
            - hash(x) = h, every time
        - Quick to compute the hash
        - Irreversible
            - Given h, hard to find x such that hash(x) = h
        - Small change in input changes the ouput significantly
        - Collision resistant
            - Hard to find x, y such that hash(x) = hash(y)
            
Examples:
    - Guessing game (psuedo random)
    
*/

contract HashFunction {
    function hash(string memory _text, uint _num, address _addr)
    public pure returns (bytes32)
    {
        return keccak256(abi.encodePacked(_text, _num, _addr));
    }
    
    // Creating a collision
    function collision(string memory _text, string memory _anotherText)
        public pure returns (bytes32)
    {
        // Creating a collision by passing more than one dynamic data type to encodePacked
        // encodePacked concatenates the two strings
        // abi.encode will prevent a collision from occuring
        return keccak256(abi.encodePacked(_text, _anotherText));
    }
}

contract GuessTheMagicWord {
    bytes32 public answer = 
        0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;
        
    function guess(string memory _word) public view returns (bool) {
        return keccak256(abi.encodePacked(_word)) == answer;
    }
}