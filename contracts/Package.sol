// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Package is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor () ERC721("Package", "PAC") {}

  function mintPackage(string memory tokenURI) public returns (uint256) {
    _tokenIds.increment();

    uint256 newItemId = _tokenIds.current();
    _safeMint(msg.sender, newItemId);
    _setTokenURI(newItemId, tokenURI);

    return newItemId;
  }
}
