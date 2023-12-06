// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;


contract Structs{

Declaring a struct for grouping structured data of a person  
struct Person{
  string name;
  int age;
  string profession;
}

//declaring a variable of datatype "struct Person"
Person public person;

//declaring an array "people" of structure "person"
Person[] public people;

//initializing and storing person as and individual under "people" array of structures
function initializeAndStoreStruct(string memory name, int  age, string memory profession) external returns (Person memory) {
     /**
      *A function for initializes and stores struct elements in the "people" array.
      *The function takes in the data to be grouped under the structure,
      *initializes the struct element and stores it in the "people" array.
      **/

    Person memory individual = Person({name:name, age:age, profession:profession});
    people.push(individual);
    return individual;
  }


function RemoveStructElement(uint index) public returns (uint length){
  /**
   *A function for deleting structure elements from the "people" array.
   *The function takes in the index of the element to be deleted and perfoms its
   *operation.
   **/

  require(index < people.length, "index out of bound");
  for (uint i = index; i < people.length; i++){
    people[i] = people[i + 1];
    people.pop();
  }
  length = people.length;
}
}