// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TwoFactorAuth {
    // Mapping from user address to hashed secret key
    mapping(address => bytes32) private userSecrets;

    // Event to log successful registration
    event Registered(address indexed user);

    // Function to register user with a hashed secret key
    function register(bytes32 hashedSecret) external {
        userSecrets[msg.sender] = hashedSecret;
        emit Registered(msg.sender);
    }

    // Function to generate a 2FA token based on the current block timestamp
    function generateToken(uint timestamp, bytes32 secret) private pure returns (uint) {
        return uint(keccak256(abi.encodePacked(secret, timestamp))) % 1000000; // 6-digit token
    }

    // Function to verify the submitted 2FA token
    function verifyToken(uint submittedToken) external view returns (bool) {
        require(userSecrets[msg.sender] != 0, "User not registered");

        // Use the current timestamp to generate the expected token
        uint timestamp = block.timestamp / 30; // 30 seconds window
        uint expectedToken = generateToken(timestamp, userSecrets[msg.sender]);

        // Check if the submitted token matches the expected token
        return submittedToken == expectedToken;
    }
}
