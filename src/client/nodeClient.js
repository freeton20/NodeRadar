const { TonClient } = require("@tonclient/core");
const { libNode } = require("@tonclient/lib-node");

TonClient.useBinaryLibrary(libNode)

const client = new TonClient({
    network: {
        server_address: "localhost",
    }
});

module.exports = {    
    client
}