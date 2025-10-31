<<<<<<< HEAD
Excellent — here’s your **updated professional README.md** including the new
🪄 **“Project Vision”** section — written in a way that sounds *forward-thinking, elegant, and professional*,
without mixing it with your visionary consciousness project.

---

## 🪙 MoodNft — Dynamic On-Chain Mood NFT (Solidity, Foundry, zkSync Ready)

### 🔗 Live Contract

**Deployed on Sepolia Testnet:** [0x645B18451D1f4C419688AF2522FE1411261CF114](https://sepolia.etherscan.io/address/0x645B18451D1f4C419688AF2522FE1411261CF114)

---

### 📖 Overview

**MoodNft** is a fully on-chain, dynamic NFT that visually reflects the holder’s emotional state.
Each minted NFT starts with a **default “HAPPY” mood** and can be flipped to “SAD” (and vice versa) directly on-chain using Solidity’s efficient state management.

This project demonstrates advanced **NFT design**, **contract architecture**, and **stateful metadata encoding** using **Base64**, ensuring that all image data lives 100% on-chain — without relying on IPFS or external storage.

---

### ⚙️ Key Features

✅ **Fully On-Chain Metadata** – SVGs encoded directly into the contract using Base64.
✅ **Dynamic NFT Logic** – Each token’s mood can toggle between “HAPPY” and “SAD.”
✅ **ERC721 Standard** – Built on top of OpenZeppelin’s proven ERC721 implementation.
✅ **Custom Errors for Gas Optimization** – Replaces `require()` messages for lower gas costs.
✅ **Test Coverage with Foundry** – Includes structured unit tests following the Arrange-Act-Assert pattern.
✅ **zkSync Compatible** – Easily deployable to Layer-2 zkSync Era networks for scalability and low fees.
✅ **Readable & Modular Architecture** – Written with best practices in Solidity 0.8.x for maintainability and clarity.

---

### 🧩 Tech Stack

| Layer             | Technology                           |
| :---------------- | :----------------------------------- |
| Smart Contracts   | Solidity ^0.8.18                     |
| Framework         | Foundry (Forge, Cast, Anvil)         |
| Standards         | ERC721, OpenZeppelin                 |
| Encoding          | Base64 On-Chain SVGs                 |
| L2 Compatibility  | zkSync Era Testnet                   |
| Verification      | Etherscan (Sepolia)                  |
| Deployment Script | Forge Script (`DeployMoodNft.s.sol`) |

---

### 🧪 Testing

Unit tests are written using **Foundry**, following the **Arrange → Act → Assert** pattern to ensure clarity and reliability.

Example:

```solidity
function test_mintSetsDefaultMoodToHappy() public {
    // Arrange
    MoodNft moodNft = new MoodNft(sadSvg, happySvg);
    
    // Act
    moodNft.mintNft();

    // Assert
    assert(moodNft.getMood(0) == MoodNft.Mood.HAPPY);
}
```

Run tests:

```bash
forge test -vvv
```

---

### 🚀 Deployment

#### 🧱 Deploy to Sepolia

```bash
forge script script/DeployMoodNft.s.sol:DeployMoodNft \
--rpc-url $SEPOLIA_RPC_URL \
--private-key $PRIVATE_KEY \
--broadcast \
--verify \
--etherscan-api-key $ETHERSCAN_API_KEY
```

#### ⚡ Deploy to zkSync Era Testnet

```bash
forge script script/DeployMoodNft.s.sol:DeployMoodNft \
--rpc-url https://sepolia.era.zksync.dev \
--private-key $PRIVATE_KEY \
--broadcast
```

---

### 🧭 Contract Functions

| Function                    | Description                                 |
| :-------------------------- | :------------------------------------------ |
| `mintNft()`                 | Mints a new NFT with mood set to `HAPPY`.   |
| `flipMood(uint256 tokenId)` | Toggles the mood between `HAPPY` and `SAD`. |
| `tokenURI(uint256 tokenId)` | Returns the Base64-encoded JSON metadata.   |
| `getMood(uint256 tokenId)`  | Returns the current mood of a given token.  |
| `getTokenCounter()`         | Returns total number of NFTs minted.        |

---

### 🔍 Contract Verification

The contract is verified and viewable on **Etherscan Sepolia**:
👉 [View Verified Contract on Etherscan](https://sepolia.etherscan.io/address/0x645B18451D1f4C419688AF2522FE1411261CF114)

---

### 🧠 Best Practices Used

* **Error Customization:** `error MoodNft__CantFlipMoodIfNotOwnerOrApproved()` for gas efficiency
* **Security Checks:** Ownership and approval validation before mood flipping
* **Gas Optimization:** Minimal state updates and optimized revert conditions
* **Code Readability:** Clear separation between on-chain logic and test code

---

### 🏗️ Project Structure

```
foundry-nft-f23/
├── src/
│   └── MoodNft.sol
├── script/
│   └── DeployMoodNft.s.sol
├── test/
│   └── MoodNftTest.t.sol
├── foundry.toml
└── README.md
```

---

### 🧰 Requirements

* Node.js (optional, for scripts)
* Foundry
* Rust & Cargo (for zkSync support)
* Etherscan API key (for contract verification)
* .env file configured with:

  ```
  PRIVATE_KEY=
  SEPOLIA_RPC_URL=
  ETHERSCAN_API_KEY=
  ```

---

### 🌐 Project Vision

The **MoodNft** project explores how digital identity and emotion can coexist securely on the blockchain.
Future updates may include:

* Expanding from binary emotions (happy/sad) to a **multi-emotion spectrum** represented on-chain
* Integrating **user sentiment feeds or oracles** for real-time dynamic NFTs
* Enabling **cross-layer NFT state syncing** between Ethereum and zkSync
* Introducing **metadata evolution mechanics** that reflect user activity, time, or network conditions

The broader goal is to demonstrate how NFTs can evolve beyond static collectibles —
into **living, expressive digital assets** that mirror real-world states and data in a verifiable, decentralized way.

---

### 🧑‍💻 Author

**Developer:** [Kiptoo Dennis]
**GitHub:** [YourGitHubUsername]
**Email :** [[youremail@example.com](mailto:denniskiptoo034@gmail.com)]

---

### 📜 License

This project is released under the **MIT License**.

---

### 📈 SEO Keywords

*Solidity NFT Developer, On-Chain NFT, Dynamic NFT, ERC721 Foundry, zkSync NFT, Mood NFT Project, Base64 Metadata, Solidity Smart Contracts, Ethereum Sepolia Testnet, Blockchain Developer Portfolio, Professional Smart Contract Engineer*

---

Would you like me to polish this next into a **GitHub-optimized Markdown layout** (with emojis, badges, and repo header visuals) so it instantly looks “featured project”–ready when people visit your repo?
=======
# FOUNDRY-NFT
A Foundry-based NFT smart contract boilerplate featuring ERC721 implementation, deployment scripts, and test automation. Ideal for Solidity developers building on L1 and zksync testnets.
>>>>>>> afe88f2889a8742f5357907a931b424bbbd7f776
