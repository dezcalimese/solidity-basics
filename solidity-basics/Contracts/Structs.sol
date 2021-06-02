pragma solidity ^0.5.12;

contract Todos {
    
    struct Todo {
        string text;
        bool completed;
    }
    
    Todo[] public todos;
    
    function create(string memory _text) public {
        todos.push(Todo(_text, false));
    }
        
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }
        
    // Update text
    function update(uint _index, string memory _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }
        
    // Update completed
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}