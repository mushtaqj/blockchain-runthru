// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

library Math {

    function divide(uint256 numerator, uint256 denominator) internal pure returns(uint256) {
        require(denominator > 0); 
        return numerator / denominator;
    }

}

contract LibraryContract {

    uint256 public value;

    function calculate(uint _value1, uint _value2) public {
        
        value = Math.divide(_value1, _value2);
    }

}