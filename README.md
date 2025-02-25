# Tanzania-Stablecoin
A secure smart contract for a Tanzanian Shilling (TSH) stablecoin
# Tanzanian Shilling (TSH) Stablecoin

## Overview
TSHStablecoin is an ERC-20 token that represents a 1:1 pegged stablecoin for the Tanzanian Shilling (TSH). It is backed by collateral such as government bonds and USDC, ensuring stability and trust in its value. The contract includes features for minting, burning, pausing, and managing collateral reserves.

## Features
- **ERC-20 Compliant**: Implements the ERC-20 token standard for seamless compatibility.
- **Collateral-Backed**: Supports deposits of government bonds and USDC as collateral.
- **Minting & Burning**: Authorized minters can issue tokens, while any holder can burn their tokens.
- **Access Control**: Owner can add/remove minters.
- **Security Measures**:
  - Pausable contract to prevent exploits during emergencies.
  - Reentrancy protection for secure fund transfers.
  - Prevents duplicate payments.

## Smart Contract Components
### Functions
- `constructor() ERC20("Tanzanian Shilling Stablecoin", "TSH")`: Initializes the contract and sets the deployer as an authorized minter.
- `addMinter(address minter)`: Grants minting rights to a new address.
- `removeMinter(address minter)`: Revokes minting rights from an address.
- `mint(address to, uint256 amount)`: Mints new tokens to a specified address.
- `burn(uint256 amount)`: Burns tokens from the caller’s balance.
- `depositCollateral(uint256 amount, string calldata collateralType)`: Deposits collateral (government bonds or USDC).
- `withdrawCollateral(uint256 amount, string calldata collateralType)`: Withdraws collateral (restricted to owner).
- `pause() / unpause()`: Enables/disables token transfers and minting.
- `payWinner(address payable winnerAddress)`: Handles secure payments with duplicate payment prevention.

## Deployment & Setup
### Prerequisites
- Solidity `^0.8.19`
- Hardhat/Truffle
- Node.js & npm
- MetaMask & Web3 wallet

### Steps to Deploy
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/tsh-stablecoin.git
   cd tsh-stablecoin
   ```
2. Install dependencies:
   ```sh
   npm install
   ```
3. Compile the smart contract:
   ```sh
   npx hardhat compile
   ```
4. Deploy to a test network (e.g., Goerli):
   ```sh
   npx hardhat run scripts/deploy.js --network goerli
   ```

## Usage
### Minting Tokens
```solidity
mint(address recipient, uint256 amount);
```
Only authorized minters can call this function.

### Burning Tokens
```solidity
burn(uint256 amount);
```
Token holders can burn their tokens to reduce total supply.

### Managing Collateral
```solidity
depositCollateral(uint256 amount, string calldata collateralType);
withdrawCollateral(uint256 amount, string calldata collateralType);
```
Collateral can be deposited and withdrawn only by the contract owner.

## Security Considerations
- **Pausable**: Emergency stop mechanism to mitigate risks.
- **Reentrancy Protection**: Ensures safe handling of funds.
- **Access Control**: Restricts minting and collateral management to authorized accounts.

## License
This project is licensed under the MIT License.

## Contact
For inquiries or contributions, open an issue on GitHub or contact the project maintainers.
