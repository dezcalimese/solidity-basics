pragma solidity ^0.5.11;

/*

// Inheriting from multiple contracts

contract A {
    function foo() public pure returns (string memory) {
        return "A";
    }
}

contract B {
    function foo() public pure returns (string memory) {
        return "B";
    }
}

contract C is A, B {
    // foo returns "B"
}

contract C is B, A {
    // foo returns "A"
}

contract D is A, C {
}

*/

// Events & Using the `super` keyword to call all parent contracts

contract A {
    event Log(string message);
    
    function foo() public {
        emit Log("A.foo was called");
    }
    
    function bar() public {
        emit Log("A.bar called");
    }
}

contract B is A {
    function foo() public {
        emit Log("B.foo called");
        A.foo();
    }
    
    function bar() public {
        emit Log("B.bar called");
        super.bar();
    }
}

contract C is A {
    function foo() public {
        emit Log("C.foo called");
        A.foo();
    }
    
    function bar() public {
        emit Log("C.bar called");
        super.bar();
    }
}

contract D is B, C {
}

