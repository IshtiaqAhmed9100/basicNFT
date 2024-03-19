// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.24;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract QueckoNft is ERC721URIStorage, Ownable {
    constructor(address owner) Ownable(owner) ERC721("Quecko NFT", "QNft") {}

    uint256 public _tokenIds;

    function mint(
        address recipient ,
        string memory _tokenURI
    ) public returns (uint256) {

        if (_tokenIds < 10) {

            _tokenIds += 1;

            uint256 newItemId = _tokenIds;

            _mint(recipient, newItemId);
            _setTokenURI(newItemId, _tokenURI);
            return newItemId;

        } else {
            revert("Token limit exceeded");
        }
    }

    function burn(uint256 _tokenId) public {
        _burn(_tokenId);
    }
}
