// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract EventsContract {

    mapping (address => uint256) public balances;
    address payable wallet;
    event Purchase(address indexed buyer, uint256 amount);

    constructor(address payable _wallet) {
        wallet = _wallet;
    }

    receive() external payable{
        buyToken();
    }

    function buyToken() public payable{
        balances[msg.sender] += 1;
        //send ether to the wallet
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }
}