// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Users{
  //A contract for storing users of an app
  address public _owner;

  enum group{
    student,
    tutor,
    admin,
    superAdmin
  }

  struct Phrase{
    //A structure for storing an account secret phrase
    string[12] words;
  }

  struct User{
    //A structure for grouping a user data
    string fullName;
    int age;
    address walletAddress;
    group userGroup;
    int TotalBalance;
    Phrase secret_phrase;
  }

  //declaring an array of User struct
  User[] users;

  function claimOwnership(address new_owner, address old_owner) external  returns(string memory){
    /**
     *A function created to claim a the written contract
     **/
     
      require(_owner == old_owner, "invalid address for the current owner");
      _owner = new_owner;
      return ("contract ownership claimed successfully");
      }

  function createUser(string calldata name, address wallet_address, int balance, int age, group userType, string[12] calldata secretPhrase) external returns (User memory) {
     /**
      *A function for initializes and stores a user under the "User" struct
      *The function takes in the data to be grouped under the structure,
      *initializes the struct element and stores it in the "users" array.
      *@name - user's name
      *@wallet_address - user's wallet address
      *@age - user's age
      *@userType - who the user is. E.g student or mentor
      **/
    uint j = 0;

    //checks if a wallet address already exists
    while(j != users.length){
      require( users[j].walletAddress != wallet_address, "An account already has this wallet address");
      j++;
    }

    User memory new_user;
    new_user.fullName = name;
    new_user.walletAddress = wallet_address;
    new_user.TotalBalance = balance;
    new_user.age = age;
    new_user.userGroup = userType;

    require(secretPhrase.length == 12, "Number of words incomplete or exceeded");
    for(uint i = 0; i < 12; i++){
      new_user.secret_phrase.words[i] = secretPhrase[i];
    }

    users.push(new_user);
    return new_user;
  }


  function getUser(uint index) external view returns (User memory){
    /**
      *A function that gets an existing account in the user array
      *@index - the index number of the array to pick form
      **/
    return users[index];
  }

}