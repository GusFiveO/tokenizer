### Drip NFT Smart Contract Documentation

#### Introduction
The Drip smart contract is an ERC721-compliant non-fungible token (NFT) contract that allows users to mint NFTs with optional royalties. This documentation provides an overview of the contract's functionalities and usage.

#### Contract Overview
- **Name:** Drip
- **Symbol:** 42D

#### Contract Features
1. **Mint NFTs:** Users can mint NFTs with or without royalties.
2. **Royalty Support:** NFT creators can specify a royalty percentage for each NFT minted.
3. **ERC2981 Compatibility:** The contract implements the IERC2981 interface to support royalty payments.

#### Usage
1. **Minting NFTs:**
   - **Function:** `mintNFTWithRoyalty`
   - **Parameters:**
     - `recipient`: Address of the NFT recipient.
     - `tokenURI`: URI of the NFT's metadata.
     - `royaltyReceiver`: Address to receive royalty payments.
     - `feeNumerator`: Royalty fee numerator (percentage of sale price).
   - **Access:** Restricted to the contract owner (deployer).
   - **Usage:** Call this function to mint a new NFT with specified royalties.

2. **Royalty Information:**
   - **Function:** `royaltyInfo`
   - **Parameters:**
     - `_tokenId`: ID of the NFT.
     - `_salePrice`: Sale price of the NFT.
   - **Return Values:**
     - `receiver`: Address to receive royalty payments for the specified NFT.
     - `royaltyAmount`: Calculated royalty amount based on the sale price.
   - **Usage:** Use this function to retrieve royalty information for a specific NFT.

#### Example Usage
```solidity
// Deploy the Drip contract
Drip dripContract = new Drip();

// Mint an NFT with royalties
address recipient = 0x...; // Recipient's address
string memory tokenURI = "https://example.com/metadata.json"; // Metadata URI
address royaltyReceiver = 0x...; // Royalty receiver's address
uint256 feeNumerator = 5000; // Royalty fee numerator (50%)
uint256 tokenId = dripContract.mintNFTWithRoyalty(recipient, tokenURI, royaltyReceiver, feeNumerator);

// Retrieve royalty information for the minted NFT
(address receiver, uint256 royaltyAmount) = dripContract.royaltyInfo(tokenId, salePrice);
```
