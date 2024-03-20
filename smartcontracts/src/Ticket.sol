// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract Ticket is ERC721URIStorage, Ownable {
    uint256 public nextTokenId;
    address public admin;

    mapping(uint256 tokenId => string) private _gameResultsUri;

    constructor(string memory _name, string memory _symbol, address initialOwner) ERC721(_name, _symbol) Ownable(initialOwner) {
    }

    function safeMint(address to, string memory uri) public onlyOwner {
        require(to != address(0), "Cannot mint to zero address");
        _safeMint(to, nextTokenId);
        _setTokenURI(nextTokenId, uri); //metadados no IPFS
        nextTokenId++;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://"; //hash IPFS
    }

    // Função para atualizar o administrador do contrato
    function setAdmin(address newAdmin) external onlyOwner {
        require(newAdmin != address(0), "Invalid address");
        admin = newAdmin;
    }

    function updateUriWithResult(uint256 _tokenId, string memory gameResult) external onlyOwner {
        _gameResultsUri[_tokenId] = gameResult;
    }


}
