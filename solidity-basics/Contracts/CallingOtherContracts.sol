pragma solidity ^0.5.11;

/*
Calling other contracts

Examples:
    - Call non payable function in another contract
    - Call payable function in another contract
*/

contract Callee {
    uint public x;
    uint public value;
    
    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }
    
    function setXAndSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;
        
        return (x, value);
    }
}

contract Caller {
    // Passing the contract as input
    function setX(Callee _callee, uint _x) public {
        uint x = _callee.setX(_x);
    }
    
    // Passing the address of the contract as input 
    function setXFromAddress(address _addr, uint _x) public {
        Callee callee = Callee(_addr);
        uint x = callee.setX(_x);
    }
    
    // Calling a payable function and sending ether with it
    function setXAndSendEther(Callee _callee, uint _x) public payable {
        (uint x, uint value) = _callee.setXAndSendEther.value(msg.value)(_x);
    }
}