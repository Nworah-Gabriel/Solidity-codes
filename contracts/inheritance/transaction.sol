// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "contracts/inheritance/inheritance.sol";
// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract transactions is Users{
    //a contract for running trading transactions
    address transactionUser;
    bool status;

    constructor(address user){
      transactionUser = user;  
    }

    modifier checkOwner(){
    require(Users._owner == transactionUser, "transaction paused by the contract owner");
    _;
    }

    function PauseTransaction(bool _paused) external checkOwner returns (string memory){
        /**
         *A function that sets the transaction status
         **/
        status = _paused;
        return ("paused");
        }

    function creditAddress(address sender_address, address reciever_address, int amount) external returns(string memory){
        /**
         *A function created for crediting a wallet address
         **/
        
        uint count = 0;
        while(count != users.length){
            //debiting the token reciever
            if (users[count].walletAddress == sender_address){
                users[count].TotalBalance += amount;
                count += 1;
            }
            if (users[count].walletAddress == reciever_address){
                assert(users[count].TotalBalance > amount);
                users[count].TotalBalance += amount;
                count += 1;
            }
            
            else{
                count += 1;
            }
        }    
           
        return("wallet address credited");
    }
    

}