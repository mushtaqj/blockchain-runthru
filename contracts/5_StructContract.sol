// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract StructContract {

    Person[] public people;
    uint256 public peopleCounter;

    struct Person {
        string _firstName;
        string _lastName;
    }

    function addPerson(string memory firstName, string memory lastName) public {
        people.push(Person(firstName, lastName));
        peopleCounter += 1;
    }
}