# 🪙 Crowdsale Smart Contract (Learning Project)

## 🚀 Project Overview

This project simulates a token crowdsale designed to raise funds for development and marketing. Participants purchase tokens during the crowdsale phase in exchange for crypto (on testnets only, for now). The contract suite includes whitelisting capabilities for early participants and models common token sale mechanics.

> ⚒️ Built as part of a hands-on blockchain developer mentorship.

---

## 📦 Token Details

- Tokens are distributed in exchange for user contributions (testnet ETH).
- These tokens are **not tradable on live exchanges** — this is a testnet-only project.
- Tokens represent a **stake or placeholder value** within the simulated ecosystem.

---

## 🔄 Crowdsale Flow

1. **Preparation**  
   Build community engagement via social media and crypto-native platforms.

2. **Token Sale**  
   Accept investments from approved (whitelisted) participants.

3. **Token Distribution**  
   Distribute tokens post-sale via smart contract logic.

> ⚠️ *Token distribution logic is a work-in-progress and may evolve.*

---

## 🧪 Development Status

- ✅ Contracts written in Solidity  
- ✅ Hardhat used for local/testnet deployment & testing  
- ✅ Whitelist functionality implemented  
- ⏳ Timestamp and sale timing features in progress  
- ✅ Basic deployment script included (`deploy.js`)

---

## 🛠️ Tech Stack

- **Solidity** – contract logic  
- **Hardhat** – dev/test framework  
- **JavaScript** – deployment scripts  
- **Hardhat Ignition** – optional modular deployment setup

---

## 📚 Notes

This project is for **educational purposes only**.  
It does **not** represent a production-ready or audited crowdsale. Crowdsales carry risk in real-world scenarios. Always do your own research before participating in any token offering.

---

## 🧰 Getting Started

### 1. Clone the Repo

```bash
git clone https://github.com/your-username/crowdsale-project.git
cd crowdsale-project
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Compile Contracts

```bash
npx hardhat compile
```

### 4. Run Tests

```bash
npx hardhat test
```

---

## 🚀 Deployment (Local & Testnet)

### Option A: Local Network (Hardhat)

Start a local node:

```bash
npx hardhat node
```

In a second terminal:

```bash
npx hardhat run scripts/deploy.js --network localhost
```

---

### Option B: Goerli/Sepolia Testnet

Set up a `.env` file with your private key and RPC provider key:

```env
PRIVATE_KEY=your_private_key
ALCHEMY_API_KEY=your_alchemy_or_infura_key
```

Then run:

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

> 💡 Replace `sepolia` with your configured testnet as needed in `hardhat.config.js`.

---

## ✅ Whitelist Access

The crowdsale includes a built-in whitelist for early investor access.

- Only the **contract owner** can call the function:

```solidity
addToWhitelist(address user)
```

- This must currently be done manually via:
  - Hardhat console, **or**
  - Custom script extension to `deploy.js`

No external YAML or JSON files are needed at this stage.

---

## 📁 Folder Structure

```
contracts/        → Crowdsale and token contracts
scripts/          → Deployment script (deploy.js)
test/             → Unit tests (Crowdsale.test.js)
ignition/         → Optional: Hardhat Ignition modules
hardhat.config.js → Network and build config
```

---

## ✏️ Future Improvements

- [ ] Implement time-based sale start/end  
- [ ] Build a frontend interface (React or Vite)  
- [ ] Expand whitelist management with script or UI  
- [ ] Add event logs for better user feedback  
- [ ] Deploy final version to public testnet
