pragma solidity ^0.5.11;

// Calling parent constructors

contract X {
    string public name;
    
    constructor(string memory _name) public {
        name = _name;
    }
}

contract Y {
    string public text;
    
    constructor(string memory _text) public {
        text = _text;
    }
}

// Calling the constructors of several contracts
contract B is X("Fixed input"), Y("Another fixed input") {
    
}

// Calling a fixed input to the parent contract 
// Also calling the parent constructor inside the constructor of the child contract (contract Y in this example)
contract C is X, Y {
    constructor() X("Another way to hard code input") Y("Another fixed input") public {
        
    }
}

// Calling a variable input to the parent contract
// Also passing variables to parent contracts
contract D is X, Y {
    constructor(string memory _name, string memory _text) X(_name) Y(_text) public {
        
    }
}

// Order of constructor initializations

contract X {
    event Log(string message);
    
    string public name;
    
    constructor(string memory _name) public {
        name = _name;
        
        emit Log(_name);
    }
}

contract Y {
    event Log(string message);
    
    string public text;
    
    constructor(string memory _text) public {
        text = _text;
        
        emit Log(_text);
    }
}

contract E is X, Y {
    constructor() X("X was called") Y("Y was called") public {
        
    }
}

contract F is X, Y {
    constructor() Y("Y was called") X("X was called") public {
        
    }
}

// Overrriding state variables

contract A {
    address public addr = 0x0000000000000000000000000000000000000001;
    
    function getAddress() public view returns (address) {
        return addr;
    }
}

// Incorrect way 
contract B is A {
    address public addr = 0x0000000000000000000000000000000000000002;
}

// Correct way
contract C is A {
    constructor() public {
        addr = 0x0000000000000000000000000000000000000003;
    }
}