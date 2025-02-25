pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/access/Ownable.sol";

contract TSHStablecoin is ERC20, Ownable {
    address public owner;
mapping(address=>bool)voterRegistry;

// Lockstep transaction modifier 
modifier lockstep() {
        require(msg.sender == tx.origin, "Reentrancy Protection");
}

constructor() payable { // Set the deployer as the initial winner and owner.
        super();
owner = msg.sender;  // Set the deployer as the initial winner and owner.

}

function addLiquidity(uint256 _amount) external onlyOwner {

require(_amount >0 &&_amount <=10000000,"Invalid Liquidity Amount");

balances[msg.sender] += _amount;
emit LiquityAdded(msg.sender, _amount);
}
// Function to pay Winner
modifier lockstep() {
        require(msg.sender == tx.origin, "Reentrancy Protection");
}

function voteOnOdds(address payable voterAddress) public onlyVoter {

require(voterRegistry[voterAddress] );

balances[_winnerAddress] += msg.value;

emit VoteCast(msg.sender, voterAddress);
}
// Prevent duplicate payments
modifier preventDuplicatePayment() {
        require(balances[msg.sender]==0,"Sender already paid out");
         _;
}

function getBalance() public view returns (uint256) {
       return balances[msg.sender];
   }
   
    modifier onlyOwner(){
        require(msg.sender == owner, "Only the contract's Owner can perform this action.");
        _; 
     }

modifier correctPreventDuplicatePayment() {
require(balances[msg.sender]==0,"Sender already paid out");
_;
}

function payWinner(address payable  winnerAddress) public lockstep preventDuplicatePayment{
 require(winnerAddress != msg.sender);

balances[winnerAddress] += msg.value;

emit WinnerPaid(msg.sender, winnerAddress);
}