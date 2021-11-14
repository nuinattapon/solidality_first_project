// SPDX-License-Identifier: MIT

pragma solidity >=0.8.4 <0.9.0;

contract Ownable {
    address payable public owner;
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner.");
        _;
    }

    constructor() {
        owner = payable(msg.sender);
    }
}

contract SecretVault {
    string secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    function getSecret() public view returns (string memory) {
        return secret;
    }

}

contract MyContract is Ownable{
    address secretVault;
    
    constructor(string memory _secret) {
        super;
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
    }
    
    function getSecret() public view onlyOwner returns (string memory) {
        SecretVault _secretVault = SecretVault(secretVault);
        
        return _secretVault.getSecret();
    }    
}
