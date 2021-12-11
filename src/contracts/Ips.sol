pragma ton-solidity >= 0.47.0;

contract Ips {

    string[] public ips;

    function update(string[] i) public{    
        tvm.accept();    
        ips = i;
    }
}