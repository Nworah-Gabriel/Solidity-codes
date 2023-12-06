// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;


contract functionModifiers{
bool public status;

// Declaring a struct for grouping structured data of an account  
struct Account{
  address walletAdrress;
  int balance;
  string status;
}



//declaring an array "account" of structure "Account"
Account[] public accounts;

//initializing and storing Account as and new_account under "acoounts" array of structures
function create(address wallet_adrress, int balance) external returns (Account memory) {
     /**
      *A function for initializes and stores struct elements in the "account" array.
      *The function takes in the data to be grouped under the structure,
      *initializes the struct element and stores it in the "accounts" array.
      **/

    Account memory new_account = Account({walletAdrress:wallet_adrress, balance:balance, status:"active"});
    accounts.push(new_account);
    return new_account;
  }


function PauseTransaction(bool _paused) external{
    /**
     *A function that sets the transaction status
     **/
  status = _paused;
}

modifier checkStatus(){
  require(!status, "Transaction status has been set to paused");
   _;
}

function credit(uint account_index, int amount) external checkStatus returns(string memory){
    /**
     *A function created for crediting a wallet address
     **/
  require(accounts.length > account_index, "account does not exist");
  accounts[account_index].balance += amount;

  return("credited");
}

function debit(uint account_index, int amount) external checkStatus returns(string memory){
    /**
     *A function created for debiting a wallet address
     **/
  require(accounts.length > account_index, "account does not exist");
  accounts[account_index].balance -= amount;

  return("debited");
}
}
