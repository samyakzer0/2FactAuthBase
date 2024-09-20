

---

# Two-Factor Authentication (2FA) via Web3 🔐

This project's base file implements a **Two-Factor Authentication (2FA)** mechanism using **Solidity**. It enables users to register a secret key, generate time-based one-time passwords (TOTPs), and verify them, all on-chain using a blockchain-based smart contract.

## Features
- **User Registration**: Users can register with a hashed secret key that is securely stored on the blockchain.
- **Token Generation**: Time-based 6-digit tokens are generated based on the current timestamp and user's secret key.
- **Token Verification**: Users can submit their 2FA token, which is then verified on-chain.

## Technologies Used
- **Solidity**: Smart contract for 2FA mechanism
- **Web3.js**: Interacting with the blockchain from the frontend
- **Hardhat/Truffle**: For development and testing
- **MetaMask**: For Web3 wallet management


## How It Works

1. **User Registration**:
   - Users can register their hashed secret key using the `register()` function. This secret is securely stored on the blockchain.
   - Example: `register(keccak256("your-secret-key"))`.

2. **Token Generation**:
   - The contract generates a **6-digit** token using the hashed secret key and current block timestamp. The token changes every 30 seconds.
   - Tokens are generated using the formula:  
     `uint(keccak256(abi.encodePacked(secret, timestamp))) % 1000000`.

3. **Token Verification**:
   - Users submit their current token using the `verifyToken()` function. The contract checks if the submitted token matches the expected one based on the timestamp.

## Getting Started

### Prerequisites
- [Node.js](https://nodejs.org/)
- [MetaMask](https://metamask.io/)
- [Hardhat](https://hardhat.org/) or [Truffle](https://www.trufflesuite.com/)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/two-factor-auth-web3.git
   ```

2. Install dependencies:

   ```bash
   npm install
   ```

3. Compile the smart contract:

   ```bash
   npx hardhat compile
   ```

4. Deploy the contract to a local or test blockchain:

   ```bash
   npx hardhat run scripts/deploy.js --network sepolia
   ```


## License
This project is licensed under the MIT License.

---
