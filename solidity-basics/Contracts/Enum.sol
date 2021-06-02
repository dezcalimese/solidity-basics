pragma solidity ^0.5.12;

contract Order {
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
    
    Status public status;
    
    function ship() public {
        // updating a status
        require(status == Status.Pending);
        status = Status.Shipped;
    }
    
    function acceptDelivery() public {
        require(status == Status.Shipped);
        status = Status.Accepted;
    }
    
    function rejectDelivery() public {
        require(status == Status.Shipped);
        status = Status.Rejected;
    }
    
    function cancel() public {
        require(status == Status.Pending);
        status = Status.Canceled;
    }
}