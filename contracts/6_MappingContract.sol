// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract MappingContract {

    mapping(uint => Person) public people;
    uint256 public peopleCounter;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    // Create a modifier which allows only the owner to execute 
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    function addPerson(string memory firstName, string memory lastName) public onlyOwner{
        incrementCounter();
        people[peopleCounter] = Person(peopleCounter, firstName, lastName);
    }

    function incrementCounter() internal {
        peopleCounter += 1;
    }
}