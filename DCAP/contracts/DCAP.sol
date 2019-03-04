pragma solidity ^0.4.23;

contract DCAP {
     
	address public ca = msg.sender;
	address public manager = 0xe410144c6c19e741d2b3b2ee7ead945ef7377db0;
    mapping(address => uint256) public PK2TX;
	mapping(address => bool) public bList;
 
	event _update(address indexed requester);
	event _get(address indexed requester);
    event _deletetx(address indexed requester);
	event _updateBList(address indexed requester);
	event _isLegal(address indexed requester);
    function DCAP() public {

    }
	
	function update(address user, uint256 txid) public returns (address addr){
		require(msg.sender == ca);
        PK2TX[user] = txid;
		_update(msg.sender);
        return msg.sender;
    }	

    function get(address user) public view returns (uint256 txid) {
		_get(msg.sender);
        return PK2TX[user];
    }
	
	function deletetx(address target) public
	{
		require(msg.sender == ca);		
        delete PK2TX[target]; 
		_deletetx(msg.sender);
    }
	function updateBList(address user, bool state) public returns (address addr)
	{
		require(msg.sender == manager);
		bList[user] = state;
		_updateBList(msg.sender);
		return msg.sender;
	}
	function isLegal(address user) view returns (bool state)
	{
		_isLegal(msg.sender);
		return bList[user];
	}
    
}

