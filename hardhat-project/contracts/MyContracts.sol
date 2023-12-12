// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "hardhat/console.sol";

contract CertificateNFT is ERC721URIStorage{

    constructor(string memory contractname, string memory symbol) ERC721(contractname, symbol){
        console.log("Contract Name:", contractname);
        console.log("Contract symbol:", symbol);
        console.log("Contract deployer:", msg.sender);
    }
    address contractDeployer;

    ///A function that updates a state variable
    function updateContractDeployer(address _address)external returns (string memory){
        contractDeployer = _address;
        console.log("ContractDeployer variable value:" , contractDeployer);
        return("address updated successfully");
    }


    ///A function created for minting certificate as NFT
    function mintCertificate(
        address _to,
        uint _tokenId,
        string calldata _uri
    )external returns (string memory){
        _mint(_to, _tokenId);
        _setTokenURI(_tokenId, _uri);
        return("nft token minted successfully");
    }

    ///A function created for transfering certificate ownership
    function transferCertificate(
        address _to,
        address _from,
        uint _tokenId
    )external {
        approve(_to, _tokenId);
        safeTransferFrom(_from, _to, _tokenId);
    }

    ///A function to check an NFT owner
    function CheckCertificateOwnership(
        uint _tokenId
    ) external view{
        ownerOf(_tokenId);
    }
    
}