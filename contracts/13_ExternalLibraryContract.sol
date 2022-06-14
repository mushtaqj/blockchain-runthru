// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./ExternalMathLibrary.sol";


contract ExternalLibraryContract {

    uint256 public value;

    function calculate(uint _value1, uint _value2) public {
        
        value = Math.divide(_value1, _value2);
    }

}