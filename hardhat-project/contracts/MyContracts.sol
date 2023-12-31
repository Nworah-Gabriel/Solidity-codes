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
    string CertificateMintStatus;

    ///A function for updating the state variable "CertificateMintStatus" for test purpose
    function UpdateMintStatus(string memory _status) public{
        CertificateMintStatus = _status;
    }

    ///A function that updates a state variable
    function updateContractDeployer(address _address)external{
        contractDeployer = _address;
    }

    ///A function created for minting certificate as NFT
    function mintCertificate(
        address _to,
        uint _tokenId,
        string calldata _uri
    )external {
        _mint(_to, _tokenId);
        _setTokenURI(_tokenId, _uri);
        UpdateMintStatus("Success"); 
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

     ///A function for returning the state variable "contractDeployer" for test purpose
    function viewContractDeployer() external view returns(address){
        return(contractDeployer);
    }

    ///A function for returning the state variable "CertificateMintStatus" for test purpose
    function GetMintStatus() external view returns(string memory status){
        status = CertificateMintStatus;
        return(status);
    }
   
}