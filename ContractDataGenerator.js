const fs = require("fs");
const path = require("path");
const abi = JSON.parse(fs.readFileSync(path.resolve(__dirname, "src/contracts/Ips.abi.json").toString()));
const tvc = fs.readFileSync(path.resolve(__dirname, "src/contracts/Ips.tvc")).toString("base64");
const AccountContract = {
    abi,
    tvc, 
}
fs.writeFileSync(path.resolve(__dirname, "src/contracts/ContractData.json"), JSON.stringify(AccountContract, null, '\t'));


