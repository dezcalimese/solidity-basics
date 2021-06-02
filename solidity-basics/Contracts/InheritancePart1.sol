pragma solidity ^0.5.3;

contract A {
    string public name;
    
    constructor(string memory _name) public {
        name = _name;
    }
}

/* One way of passing parameters to a parent constructor

contract B is A("Contract B") {
} 

*/

/* Another way of passing parameters

contract B is A {
    constructor() A("Contract B") public
}

*/

// If you need to pass variable parameters to the constructor
contract B is A {
    constructor(string memory _name) A(_name) public {
        
    }
}