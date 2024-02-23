// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

// import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/interfaces/IERC2981.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Drip is ERC721URIStorage, IERC2981, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(uint256 => address) private _tokenRoyaltyReceivers;
    mapping(uint256 => uint256) private _tokenRoyaltyAmounts;

    constructor() ERC721("42Drip", "42D") Ownable(msg.sender) {}

    function royaltyInfo(uint256 _tokenId, uint256 _salePrice)
        external
        view
        override
        returns (address receiver, uint256 royaltyAmount)
    {
        return (_tokenRoyaltyReceivers[_tokenId], _tokenRoyaltyAmounts[_tokenId]);
    }

    function mintNFT(address recipient, string memory tokenURI)
        public onlyOwner
        returns (uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _safeMint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

      return newItemId;
    }

    function mintNFTWithRoyalty(address recipient, string memory tokenURI, address royaltyReceiver, uint96 feeNumerator)
        public onlyOwner
        returns (uint256) {
        uint256 tokenId = mintNFT(recipient, tokenURI);
        _setTokenRoyalty(tokenId, royaltyReceiver, feeNumerator);

        return tokenId;
    }

    function _setTokenRoyalty(
        uint256 tokenId,
        address royaltyReceiver,
        uint256 feeNumerator
    ) internal {
        require(ownerOf(tokenId) != address(0), "Token does not exist");
        require(royaltyReceiver != address(0), "Invalid royalty receiver");

        _tokenRoyaltyReceivers[tokenId] = royaltyReceiver;
        _tokenRoyaltyAmounts[tokenId] = feeNumerator;
    }
}
