// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract HelloWorld {
  /**
   * @dev Prints Hello World string
   */
  function print() public pure returns (string memory) {
    return "Hello World!";
  }
}
contract DataTypes{
    string whoami = "I am Chimzuruoke";
    int mobile_no = 9025091332;
    address locaiton = msg.sender;

    function print(int x, int y) public view returns (string memory, int z) {
    z = x + y;
    return (whoami, z);
    }
    function sub(int y) public view returns (string memory, int z) {
    (,int x) = print(3, 3);
    assert(y != 0);
    z = x - y;
    return (whoami, z);
    }
}