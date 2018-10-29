pragma solidity ^0.4.24;


import "../ownership/Ownable.sol";


/**
 * @title Pausable
 * @dev Base contract which allows children to implement an emergency stop mechanism.
 */
contract Pausable is Ownable {
  event Pause();
  event Unpause();

  bool public paused = false;
  mapping(address => bool) freezedAccounts;

  /**
   * @dev Modifier to make a function callable only when the contract is not paused.
   */
  modifier whenNotPaused() {
    require(!paused);
    _;
  }

  /**
   * @dev Modifier to make a function callable only when the contract is paused.
   */
  modifier whenPaused() {
    require(paused);
    _;
  }

  modifier whenNotFreezed(){
      require(!freezedAccounts[msg.sender]);
      _;
  }

  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function pause() onlyOwner whenNotPaused public {
    paused = true;
    emit Pause();
  }

  /**
   * @dev called by the owner to unpause, returns to normal state
   */
  function unpause() onlyOwner whenPaused public {
    paused = false;
    emit Unpause();
  }

  function freezeAccount(address _address) onlyOwner public returns (bool) {
    freezedAccounts[_address] = true;
    return true;
  }
  
  function unFreezeAccount(address _address) onlyOwner public returns (bool) {
    freezedAccounts[_address] = false;
    return true;
  }
  
  function isFreezed(address _owner) public view returns (bool) {
    return freezedAccounts[_owner];
  }
}
