// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import "../lib/openzeppelin-contracts/contracts/utils/Counters.sol";

contract Ticket is ERC721, Ownable{

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("MyCollectible", "MCO") {
    }

    
}