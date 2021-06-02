pragma solidity ^0.5.11;

/*
Delegatecall
    - A low level function similar to call
    - When contract A degecall contract B it runs B's code inside A's context (storage, msg.sender, msg.value)
    - Can update contract A without changing any code inside it
*/

contract B {
    // These must be in the same order as contract A 
    uint public num;
    address public sender;
    uint public value;
    
    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract B2 {
    // These must be in the same order as contract A 
    uint public num;
    address public sender;
    uint public value;
    
    function setVars(uint _num) public payable {
        num = 2 * _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public num;
    address public sender;
    uint public value;
    
    function setVars(address _contract, uint _num) public payable {
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}