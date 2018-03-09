pragma solidity ^0.4.0;

contract Fighting {
    
    address public fighter1;
    address public fighter2;
    
    bool public fighter1played;
    bool public fighter2played;

    uint private fighter1deposit;
    uint private fighter2deposit;

    bool public gameFinished;
    address public winner;
    uint gain;

    event FightingStart(address fighter1, address fighter2);
    event RoundEnd(uint fighter1deposit, uint fighter2deposit);
    event FightingEnd(address winner, uint gain);

    function Fighting() public {
        // fighter1 is who called the function
        fighter1 = msg.sender;
    }

    function registerOpponent() public {
        // this statement is dope
        require(fighter2 == address(0));

        fighter2 = msg.sender;
        
        // signals the start of wrestling
        FightingStart(fighter1, fighter2);
    }

    function fight() public payable {
        require(!gameFinished && (msg.sender == fighter1 || msg.sender == fighter2));

        if (msg.sender == fighter1) {
            require(fighter1played == false);
            fighter1played = true;
            fighter1deposit = fighter1deposit + msg.value;  // amount of ether sent
        } else {
            require(fighter2played == false);
            fighter2played = true;
            fighter2deposit = fighter2deposit + msg.value;
        }

        if (fighter1played && fighter2played) {
            if (fighter1deposit >= fighter2deposit * 2) {
                endOfGame(fighter1);
            } else if (fighter2deposit >= fighter1deposit * 2) {
                endOfGame(fighter2);
            } else {
                endOfRound();
            }
        }
    }

    function endOfGame(address fighter) internal {
        gameFinished = true;
        winner = fighter;

        gain = fighter1deposit + fighter2deposit;
        FightingEnd(fighter, gain);
    }

    function endOfRound() internal {
        fighter1played = false;
        fighter2played = false;

        RoundEnd(fighter1deposit, fighter2deposit);
    }

    function withdraw() public {
        require(gameFinished && winner == msg.sender);

        uint amount = gain;
        gain = 0;
        
        // transfer the amount to caller 
        msg.sender.transfer(amount);
    }   
}