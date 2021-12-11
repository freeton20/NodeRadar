pragma ton-solidity >= 0.47.0;

contract Ips {

    string[] public ips;

     modifier checkOwnerAndAccept {
        require(msg.pubkey() == tvm.pubkey(), 100);
		tvm.accept();
		_;
	}
    
    function addIp(string ip) public checkOwnerAndAccept {        
        ips.push(ip);
    }

    function addChunk(string[] i) public checkOwnerAndAccept{                
        for (uint256 index = 0; index < i.length; index++) {          
            ips.push(i[index]);
        }
    }

    function clean() public checkOwnerAndAccept{      
        string[] e;
        ips = e;
    }

    function countNodes() public returns(uint){
        return ips.length;
    }
    
}