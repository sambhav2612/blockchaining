pragma solidity ^0.4.9;

contract MyContract {
    string word = "Hello World";
    
    function my() public constant returns(string) {
        return word;
    }
    
    function replace(string newWord) public constant returns(string) {
        return newWord;
    }
}