#cache creator

#this is deploy script contract with cached data
#tondev se reset &> /dev/null
tondev network default dev
tonos-cli config --url http://net.ton.dev &> /dev/null
#deploy
tondev sol compile GeoIp.sol
tonos-cli genaddr --genkey ./GeoIp.keys.json ./GeoIp.tvc ./GeoIp.abi.json
tondev signer delete geoip
tondev signer add geoip ./GeoIp.keys.json
tondev contract topup GeoIp.abi.json --value 7000000000 --signer geoip
tonos-cli deploy GeoIp.tvc "{}" --abi GeoIp.abi.json --sign GeoIp.keys.json 


address=$(tondev contract info GeoIp --signer geoip | grep Address | cut -d':' -f3 | cut -d' ' -f1)

echo $address

# get Ips from store to file
#tonos-cli --url http://net.ton.dev run 0:e84e87baca40c8b972c686d8408519c74d0de46a6f1b1f6edcdcd7e4dfb11338 ips '{}' --abi Ips.abi.json | awk '/Result/,0' |  cut -d':' -f2 | cut -d'{' -f2 | cut -d'}' -f1 &> cIps.json
