// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";

contract CertificateNFT is ERC721URIStorage{

    constructor() ERC721("NFT Certificate", "DeCertify"){}

    ///A function created for minting certificate as NFT
    function mintCertificate(
        address _to,
        uint _tokenId,
        string calldata _uri
    )external {
        approve(_to, _tokenId);
        _mint(_to, _tokenId);
        _setTokenURI(_tokenId, _uri);
    }

    ///A function created for transfering certificate ownership
    function transferCertificate(
        address _to,
        address _from,
        uint _tokenId
    )external {
        setApprovalForAll(_to, true);
        safeTransferFrom(_from, _to, _tokenId);
    }

    ///A function to check an NFT owner
    function CheckCertificateOwnership(
        uint _tokenId
    ) external view{
        ownerOf(_tokenId);
    }
    
}