const { TonClient } = require("@tonclient/core");
const { libWeb, libWebSetup } = require("@tonclient/lib-web");


libWebSetup({
    binaryURL: "./tonclient.wasm",
});

TonClient.useBinaryLibrary(libWeb);
const client = new TonClient({
    network: {
        server_address: "net.ton.dev",
    }
});

module.exports = {    
    client
}