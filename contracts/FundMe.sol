// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;

contract Fundme {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        // Add requirements - check price and check room status
        require(
            msg.value >= 0.01 ether,
            "Not enough Ether provided. You need to fund me at least 0.01 ETH."
        );
        
        addressToAmountFunded[msg.sender] += msg.value;
        payable(msg.sender).transfer(msg.value);
    }
}
