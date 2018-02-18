pragma solidity ^0.4.9;

contract MyContract {
    string word = "Hello World";
    
    function my() public returns(string) {
        return word;
    }
    
    function replace(string newWord) public returns(string) {
        return newWord;
    }
}