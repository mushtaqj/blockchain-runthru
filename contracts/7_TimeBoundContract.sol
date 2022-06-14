// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract TimeBoundContract {

    mapping(uint => Person) public people;
    uint256 public peopleCounter;
    uint256 openingTime = 1652283060; 

    // Create a modifier which allows only the owner to execute 
    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;//exit and throw error
    }

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    function addPerson(string memory firstName, string memory lastName) public onlyWhileOpen{
        incrementCounter();
        people[peopleCounter] = Person(peopleCounter, firstName, lastName);
    }

    function incrementCounter() internal {
        peopleCounter += 1;
    }
}