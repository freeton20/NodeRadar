pragma ton-solidity >= 0.53.0;
pragma AbiHeader pubkey;

contract GeoIp {
    struct Point {
        string lat;
        string long;
        string asnOrganization;        
        string ip;
    }   

    Point[] public coords;
    
     modifier checkOwnerAndAccept {
        require(msg.pubkey() == tvm.pubkey(), 100);
		tvm.accept();
		_;
	}
    
    function addPoint(Point p) public checkOwnerAndAccept {        
        coords.push(p);
    }

    function addChunk(Point[] p) public checkOwnerAndAccept{                
        for (uint256 index = 0; index < p.length; index++) {          
            coords.push(p[index]);
        }
    }

    function clean() public checkOwnerAndAccept{      
        Point[] e;
        coords = e;
    }

    function countNodes() public returns(uint){
        return coords.length;
    }
}