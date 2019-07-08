pragma solidity ^0.5.0;

import "./ERC20.sol";

contract IdeaToken is ERC20 {
    uint public tweetId;
    string public tweetText;
    constructor(uint _tweetId, string memory _tweetText) public {
     tweetId = _tweetId;
     tweetText = _tweetText;
    }
}


contract IdeaFactory {

uint _tokenSuperSupply; //represents total number of idea tokens;

mapping(uint => address) public tweetIdToAddress; //get cintract address from tweetId

mapping(address => uint) public tokenOwnerToTokenCount; // used to distribute the 90% profits

function _createTokenContract(uint _tweetId,string memory _tweetText) internal {
        address newContractAddress = address(new IdeaToken(_tweetId,_tweetText));
        tweetIdToAddress[_tweetId] = newContractAddress;
        //ideaTokens.push(idea_tokens_struct(_tweetId,newContractAddress));
        }

function createIdeaToken(uint _tweetId,string memory _tweetText ) public {
    _createTokenContract(_tweetId,_tweetText);
}


function getTweetTokenSupply(uint _tweetId) public view returns (uint) {

  return IdeaToken(tweetIdToAddress[_tweetId]).totalSupply();
}

function _mintIdeaTokens(uint _tweetId,uint _amount) internal {
    IdeaToken IdeaTokenInstance = IdeaToken(tweetIdToAddress[_tweetId]);
    IdeaTokenInstance._mint(msg.sender,_amount);
    _tokenSuperSupply.add(_amount);
}

}

