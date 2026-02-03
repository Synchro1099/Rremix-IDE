// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ServiceHasher {
    
    // This function now has 4 input boxes in Remix
    function processService(
        string memory _firstName, 
        string memory _middleName, 
        string memory _lastName, 
        uint8 _code
    ) public pure returns (uint256 totalFee, bytes32 uniqueHash) {
        
        // 1. Calculate Fee
        uint8 firstDigit;
        if (_code == 1) {
            totalFee = 20000 + (20000 * 15 / 100); // 23000
            firstDigit = 2;
        } else if (_code == 2) {
            uint256 baseWithService = 3000 + (3000 * 8 / 100);
            totalFee = baseWithService + (baseWithService * 15 / 100); // 3726
            firstDigit = 3;
        } else {
            revert("Use 1 or 2");
        }

        // 2. Extract specific letters from your inputs
        bytes memory fBytes = bytes(_firstName);
        bytes memory mBytes = bytes(_middleName);
        bytes memory lBytes = bytes(_lastName);

        // Get last of first, first of middle, last of last
        string memory char1 = string(abi.encodePacked(fBytes[fBytes.length - 1]));
        string memory char2 = string(abi.encodePacked(mBytes[0]));
        string memory char3 = string(abi.encodePacked(lBytes[lBytes.length - 1]));

        // 3. Generate Hash based on the Service Code requirement
        if (_code == 1) {
            // Requirement: Use abi.encode
            uniqueHash = keccak256(abi.encode(char1, char2, char3, _code, firstDigit));
        } else {
            // Requirement: Use abi.encodePacked
            uniqueHash = keccak256(abi.encodePacked(char1, char2, char3, _code, firstDigit));
        }
    }
}