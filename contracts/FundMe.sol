// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;

contract Fundme {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        require(
            msg.value >= 0.01 ether,
            "Not enough Ether provided - minimum 0.01 ETH"
        );

        addressToAmountFunded[msg.sender] += msg.value;
        bool sent = owner.send(msg.value);

        require(sent, "Failed to send Ether");
    }
}
