tondev se reset &> /dev/null
tondev network default dev
tonos-cli config --url http://net.ton.dev &> /dev/null
#deploy
tondev sol compile Ips.sol
tonos-cli genaddr --genkey ./Ips.keys.json ./Ips.tvc ./Ips.abi.json
tondev signer delete ip
tondev signer add ip ./Ips.keys.json
tondev contract topup Ips.abi.json --value 5000000000 --signer ip
tonos-cli deploy Ips.tvc "{}" --abi Ips.abi.json --sign Ips.keys.json 


address=$(tondev contract info Ips --signer ip | grep Address | cut -d':' -f3 | cut -d' ' -f1)
#upload ips
tonos-cli call 0:$address addChunk "{\"i\":$(cat ./ips1.json)}" --abi Ips.abi.json --sign Ips.keys.json  
tonos-cli call 0:$address addChunk "{\"i\":$(cat ./ips2.json)}" --abi Ips.abi.json --sign Ips.keys.json  
tonos-cli call 0:$address addChunk "{\"i\":$(cat ./ips3.json)}" --abi Ips.abi.json --sign Ips.keys.json  
tonos-cli call 0:$address addChunk "{\"i\":$(cat ./ips4.json)}" --abi Ips.abi.json --sign Ips.keys.json  
tonos-cli call 0:$address addChunk "{\"i\":$(cat ./ips5.json)}" --abi Ips.abi.json --sign Ips.keys.json  
tonos-cli call 0:$address addChunk "{\"i\":$(cat ./ips6.json)}" --abi Ips.abi.json --sign Ips.keys.json  
tonos-cli call 0:$address addChunk "{\"i\":$(cat ./ips7.json)}" --abi Ips.abi.json --sign Ips.keys.json  
tonos-cli call 0:$address addChunk "{\"i\":$(cat ./ips8.json)}" --abi Ips.abi.json --sign Ips.keys.json  
tonos-cli run 0:$address countNodes "{}" --abi Ips.abi.json 