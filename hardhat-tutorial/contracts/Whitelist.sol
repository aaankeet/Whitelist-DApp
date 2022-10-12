//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Whitelist {

    //State Variable 
    // Max number of whitelisted addresses allowed
    uint8 public maxAddressWhitelist;

    // Track How many Addresses whitelisted
    uint8 public noAddressesWhitelisted;
    
    // Create a mapping of whitelistedAddresses
    // if an address is whitelisted, we would set it to true,
    // it is false by default for all other addresses.
    mapping (address => bool ) public isWhitelisted;
    
    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxAddressWhitelist){
        _maxAddressWhitelist = maxAddressWhitelist;
    }

    function addAddressToWhitelist() public {
        require(!isWhitelisted[msg.sender], "Already Whitelisted");
        require(noAddressesWhitelisted < maxAddressWhitelist, "Limit Reached");
        isWhitelisted[msg.sender] = true;
        noAddressesWhitelisted++;
    }
} 