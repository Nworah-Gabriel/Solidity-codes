// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;



contract NFTBounty{
    struct NFTowner{
        string name;
        int balance;
        string nftTokenUri;
        address user_address;
        // mapping(address => bool) IsOwner;
    }

    NFTowner[] nftOwners;
    
    constructor() payable {}
    receive() external payable {}
    fallback() external payable {}


    function createNFT_Owner(string calldata _name,
        int _balance,
        string calldata _nftTokenUri,
        address _user_address
        ) public {
            NFTowner memory new_User;
            new_User.name = _name;
            new_User.balance = _balance;
            new_User.nftTokenUri = _nftTokenUri;
            new_User.user_address = _user_address;
            nftOwners.push(new_User);
            

    }

    function deleteNFT_Owner(
        
        address _user_address
        ) public {
           
           for (uint count = 0; count < nftOwners.length; count++){
                if(nftOwners[count].user_address == _user_address){
                   structPopper(count);
                }
           }     
    }

    function structPopper(uint index) public payable {
        delete nftOwners[index];
        uint _length = nftOwners.length - 1;
        nftOwners[index] =  nftOwners[_length];
        nftOwners.pop();

    }

    function getLength() public view returns (uint){
        return nftOwners.length;
    }




}

contract BountyFactory{

    NFTBounty[] BountyLIst;
    constructor() payable {}
    receive() external payable { }
    fallback() external payable {}

    function createNFTBounty() public payable {
        NFTBounty nftBounty = new NFTBounty();
        BountyLIst.push(nftBounty);
    }

    function deleteNFTBounty(uint index) public payable {
        delete BountyLIst[index];
        uint _length = BountyLIst.length - 1;
        BountyLIst[index] =  BountyLIst[_length];
        BountyLIst.pop();
    }

    function getNFTBountyLength() public view returns (uint){
        return BountyLIst.length;
    }

    function getNFTBounty(uint index) public view returns (NFTBounty){
        return BountyLIst[index];
    }
}



