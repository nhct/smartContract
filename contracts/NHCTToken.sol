pragma solidity ^0.4.24;

import "./openzeppelin-solidity/contracts/token/ERC20/PausableToken.sol";
import "./openzeppelin-solidity/contracts/token/ERC20/BurnableToken.sol";
import "./openzeppelin-solidity/contracts/ownership/CanReclaimToken.sol";


contract NHCTToken is PausableToken, BurnableToken, CanReclaimToken {
    string public name = "NanoHealthCare Token";
    string public symbol = "NHCT";
    uint public decimals = 18;
    uint public INITIAL_SUPPLY = 1000000000 * (10 ** uint256(decimals));

    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        emit Transfer(0x0, msg.sender, INITIAL_SUPPLY);
    }
}

