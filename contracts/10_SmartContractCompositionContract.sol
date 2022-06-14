// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract ERC20Token {
    string public name;
    mapping (address => uint256) public balances;

    function mint() public {
        // Using msg.sender will not work here, as msg.sender will be the address
        // of the contract not the wallet which initiated the transaction
        balances[tx.origin] ++;
    }
}

contract AcceptEtherContractWithSMComposition{

    address payable wallet;
    //The address of the ERC20Token Contract Address
    address public token;

    constructor(address payable _wallet, address _token) {
        wallet = _wallet;
        token = _token;
    }

    receive() external payable{
        buyToken();
    }

    function buyToken() public payable{
        ERC20Token(address(token)).mint();
        //send ether to the wallet
        wallet.transfer(msg.value);
    }
}