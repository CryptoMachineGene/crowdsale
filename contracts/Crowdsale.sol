// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Token.sol";

contract Crowdsale {	
	
	address public owner;
	Token public token;
	uint256 public price;
	uint256 public maxTokens;
	uint256 public tokensSold;
	uint public start = block.timestamp;

	event Buy(uint256 amount, address buyer);
	event Finalize(uint256 tokensSold, uint256 ethRaised);

	mapping(address => bool) isWhitelisted;

	constructor(Token _token, uint256 _price, uint256 _maxTokens) {
		owner = msg.sender;
		token = _token;
		price = _price;
		maxTokens = _maxTokens;
	}
	
	modifier onlyOwner() {
			require(msg.sender == owner, 'Caller is not the owner');
			_;
	}

	receive() external payable {
		uint256 amount = msg.value / price;
		buyTokens(amount * 1e18);
	}

	function addWhiteList(address _user) public onlyOwner {
		isWhitelisted[_user] = true;
	}
		   
	function withdraw() public {
		require(block.timestamp > start + 1 hours);
      	payable(msg.sender).transfer(address(this).balance);
	}  

	function removeWhiteList(address _user) public onlyOwner {
		isWhitelisted[_user] = false;
	}


	function buyTokens(uint256 _amount) public payable {
		require(msg.value == (_amount / 1e18) * price);
		require(token.balanceOf(address(this)) >= _amount);
		require(token.transfer(msg.sender, _amount));
		require(block.timestamp > start + 1 hours);

		tokensSold += _amount;

		emit Buy(_amount, msg.sender);
	}

	function buyTokensWhitelist(uint256 _amount) public payable {
		require(isWhitelisted[msg.sender] == true, 'not in Whitelist');
		require(msg.value == (_amount / 1e18) * price);
		require(token.balanceOf(address(this)) >= _amount);
		require(token.transfer(msg.sender, _amount));

		tokensSold += _amount;

		emit Buy(_amount, msg.sender);
	}

	function hasStarted() public view returns (bool) {
		return block.timestamp > start + 1 hours;		
	}

	function setPrice(uint256 _price) public onlyOwner {
		price = _price;
	}
	
	function finalize() public onlyOwner {
		
		//Send remaining tokens to crowdsale creator
		require(token.transfer(owner, token.balanceOf(address(this))));
		//Send Ether to crowdsale creator
		uint256 value = address(this).balance;
		(bool sent, ) = owner.call{value: value}("");
		require(sent);

		emit Finalize(tokensSold, value);
	}
}
