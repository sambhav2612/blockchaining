pragma solidity ^0.4.18;

contract MyContract {
    string word = "Hello World";
    
    function MyContract(string myWord) public {
        myWord = word;
    }

    function my() public constant returns(string) {
        return word;
    }
    
    function replace(string newWord) public pure returns(string) {
        return newWord;
    }
}