# 🪙 Crowdsale Smart Contract (Learning Project)

## 🚀 Project Overview

This project simulates a token crowdsale designed to raise funds for development and marketing. Participants purchase tokens during the crowdsale phase in exchange for crypto (on testnets only, for now). The contract suite includes whitelisting capabilities for early participants and aims to model common token sale mechanics.

This is an active learning project built as part of my blockchain developer mentorship.

---

## 📦 Token Details

- Tokens are distributed in exchange for user contributions (testnet ETH).
- These tokens are **not tradable on live exchanges** — this is a testnet-only project.
- Tokens represent a **stake or placeholder value** within the simulated ecosystem.

---

## 🔄 Crowdsale Flow

1. **Preparation**  
   Build community engagement across social media and crypto-focused platforms.

2. **Token Sale**  
   Accept investments from approved (whitelisted) participants.

3. **Token Distribution**  
   Distribute purchased tokens post-sale via contract logic.

> ⚠️ *Token distribution is a work-in-progress and may change as the project evolves.*

---

## 🧪 Development Status

- Contracts written in Solidity
- Hardhat used for development and testing
- Includes basic error handling and deployment scripts
- Whitelisting is implemented
- Timestamp features in progress

---

## 📚 Notes

This project is for **educational purposes only**. Crowdsales carry risk in real-world scenarios, and this repo does **not** represent an audited or production-ready system. Always do your own research before participating in any token offering.

---

## 🛠️ Tech Stack

- Solidity
- Hardhat
- JavaScript (scripts + optional frontend)
- Hardhat Ignition (modular deployment)

---

## 🧰 Getting Started

### 1. Clone the Repo

```bash```
git clone https://github.com/your-username/crowdsale-project.git
cd crowdsale-project

### 2. Install Dependencies
npm install

### 3. Compile Contracts
npx hardhat compile

### 4. Run Tests
npx hardhat test

---

🚀 Deployment (Local/Testnet)
Option A: Local Network (for testing)
 - npx hardhat node

In a separate terminal:
npx hardhat run scripts/deploy.js --network localhost


Option B: Goerli or Sepolia Testnet (requires .env with private key + Alchemy/Infura)
Create a .env file:

```env```
PRIVATE_KEY=your_private_key
ALCHEMY_API_KEY=your_alchemy_or_infura_key

Then run the deployment:
npx hardhat run scripts/deploy.js --network sepolia

---

Whitelist note
> ✅ **Whitelist Access**
>
> The crowdsale includes a built-in whitelist for early investor access.  
> Only the contract owner can add addresses to the whitelist using the `addToWhitelist(address)` function in `Crowdsale.sol`.
>
> Currently, this must be done manually via the Hardhat console or by extending `scripts/deploy.js`. No external JSON or YAML files are required at this stage.
