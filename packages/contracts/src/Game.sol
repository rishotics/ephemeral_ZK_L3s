pragma solidity ^0.8.0;

contract Game {
    uint256 public playerAWin = 0;
    uint256 public playerBWin = 0;

    address playerA = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    address playerB = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;

    uint256 public playerAChoose;
    uint256 public playerBChoose;

    function playerAMoveChoose(uint256 _choose) external {
        require(msg.sender == playerA);
        playerAChoose = _choose;
    }

    function playerBMoveGuessForPlayerA(uint256 _guess) external {
        require(msg.sender == playerB);
        if (_guess == playerAChoose) {
            playerBWin++;
        }
    }

    function playerBMoveChoose(uint256 _choose) external {
        require(msg.sender == playerB);
        playerBChoose = _choose;
    }

    function playerAMoveGuessForPlayerB(uint256 _guess) external {
        require(msg.sender == playerA);
        if (_guess == playerBChoose) {
            playerAWin++;
        }
    }
}
