pragma solidity ^0.5.11;

/*
3 ways to send ether from a contract to another contract
- transfer (forwards 2300 gas, throws error if not enough gas, trying to send more than the contract holds, or a non payable address)
- send (forwards 2300 gas, throws bool)
- call (forward all gas or set gas, throws bool) (Recommended way after 2019 Dec)
*/

contract ReceiveEther {
    function () external payable {}
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }
    
    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }
    
    function sendViaCall(address payable _to) public payable {
        _to.call.value(msg.value)("");
    }
}