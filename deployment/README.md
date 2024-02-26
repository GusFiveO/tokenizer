## Deploying Smart Contract Using Remix IDE

## Introduction
Remix IDE is a powerful online development environment for Ethereum smart contracts. Here's how I deployed a smart contract using Remix IDE on the Sepolia test network.

## Steps

1. **Opened Remix IDE:**
   - I opened my browser and navigated to [Remix IDE](https://remix.ethereum.org/).
   - I ensured that the correct compiler version was selected in Remix.

2. **Wrote Smart Contract:**
   - I wrote my smart contract code or pasted it into the Remix editor.

3. **Compiled Smart Contract:**
   - Clicked on the "Solidity Compiler" tab in Remix.
   - Clicked on the "Compile" button to compile my smart contract. I ensured there were no compilation errors.

4. **Deployed Smart Contract:**
   - Switched to the "Deploy & run transactions" tab in Remix.
   - Selected "Injected Web3" from the environment dropdown menu.
   - Ensured that MetaMask was connected to the Sepolia test network.
   - Clicked on the "Deploy" button next to my smart contract.

5. **Waited for Deployment:**
   - I waited for the deployment process to complete. Remix displayed the transaction hash once the deployment was successful.

6. **Verified Deployment on Etherscan:**
   - After deployment, I verified the deployment on [Etherscan](https://sepolia.etherscan.io/).
   - Copied the transaction hash displayed in Remix after deployment.
   - Visited [Etherscan](https://sepolia.etherscan.io/) and pasted the transaction hash in the search bar.
   - Once the transaction was confirmed, I navigated to the "Contracts" tab to find my deployed contract.

7. **Interacted with Contract:**
   - After deployment, I interacted with my smart contract using the provided interface in Remix.
   - I called functions, viewed contract state, and more.
   - I used the `mintNFTWithRoyalty` method to mint an NFT with royalties. Passed the recipient's address, the tokenURI (e.g., JSON metadata stored at a specific IPFS address), the royalty receiver's address, and the royalty fee numerator as parameters.
   - `mintNFTWithRoyalty(recipientAddress, "ipfs://bafkreidmyczcqnpcur4wcqveb4fybdeijsixp3di2rs7oqukvh3yocfrfq", royaltyReceiverAddress, 1500)`

## Conclusion
That's how I successfully deployed a smart contract using Remix IDE on the Sepolia test network. Now I can utilize the deployed contract's functionalities on the Sepolia Ethereum blockchain.

**Contract Address:** [0x1234567890abcdef1234567890abcdef12345678](https://sepolia.etherscan.io/address/0x1234567890abcdef1234567890abcdef12345678)
