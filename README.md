# Node Radar (fake data now)

## Usage

Upload ips to smart contract (net.ton.dev)

```
tonos-cli call 0:16cbbd32b641a233a8897ab294fb2916cfb685a7203caddafd5c7f2e36c51c30 update "{\"i\":$(cat ./testIps.json)}" --abi Ips.abi.json --sign Any.keys.json  
```
