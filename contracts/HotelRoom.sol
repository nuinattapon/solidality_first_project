// SPDX-License-Identifier: MIT

pragma solidity >=0.8.4 <0.9.0;

contract HotelRoom {
    
    address payable public owner;
    
    enum Statuses { Vacant, Occupied }
    
    Statuses currentStatus;
    
    constructor() {
        currentStatus = Statuses.Vacant;
        owner = payable(msg.sender);
    }
    
    function book() external payable {
        // Add requirements - check price and check room status
        require(msg.value >= 2 ether, "Not enough Ether provided.");
        require(currentStatus == Statuses.Vacant,"Currently occupied.");
        
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value);
    }
}