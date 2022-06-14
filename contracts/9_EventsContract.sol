// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract AcceptEtherContract{

    mapping (address => uint256) public balances;
    address payable wallet;
    uint royaltyPercentOwner;
    uint royaltyPercentReseller;
    uint rouyaltyPercenMarketPlace;

    constructor(address payable _wallet) {
        wallet = _wallet;
    }

    receive() external payable{
        buyToken();
    }

    function buyToken() public payable{
        // take royalty each time this happens
        balances[msg.sender] += 1;
        //send ether to the wallet
        wallet.transfer(msg.value);
    }
}