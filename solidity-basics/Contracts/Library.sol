pragma solidity ^0.5.16;

/*
Library
    - No storage, no ether
    - Helps you keep your code DRY (Don't Repeat Yourself)
        - Libraries allow you to add functionality to types
    - Can save gas
    
Embedded or Linked
    - Embedded (Library has only internal functions)
    - Must be deployed and then linked (Library has public or external functions)

Examples:
    - SafeMath (Prevent uint overflow)
    - Deleting comment from array without gaps
    */
    
/* Preventing uint overflow 

library SafeMath {
    function add(uint x, uint y) internal pure returns (uint) {
        uint z = x + y;
        require(z >= x, "uint overflow");
        
        return z;
    }
}

contract TestSafeMath {
    // Attach library functions from library A to type B
    using SafeMath for uint;
    
    // two ways to pass functions in a library
    // uint x = 123;
    // x.add(456);
    // SafeMath.add(x, 456);
    
    
    uint public MAX_UINT = 2 ** 256 -1;
    
    function testAdd(uint x, uint y) public pure returns (uint) {
        return x.add(y);
        // you could also type SafeMath.add(x, y);
    }
}

*/

library Array {
    function remove (uint[] storage arr, uint index) public {
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

contract TestArray {
    using Array for uint[];
    
    uint[] public arr;
    
    function testArrayRemove() public {
        for (uint i = 0; i < 3; i++) {
            arr.push(i);
        }
        // [0, 1, 2]
        
        arr.remove(1);
        
        // [0, 2]
        assert(arr.length == 2);
        assert(arr[0] == 0);
        assert(arr[1] == 2);
    }
}