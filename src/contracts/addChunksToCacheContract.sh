set -e

#this script cached data in smart contract for quick it usage
contract='0:fee6cb8ef4dda82be13748b78b6bcd3b5fa1dd87a6d4859c31594bec86139c56'
network='net.ton.dev'

#install MAXMIND locally
#docker run -d -p 8080:8080 ghcr.io/observabilitystack/geoip-api:latest

#get ips
tonos-cli --url http://net.ton.dev run 0:e84e87baca40c8b972c686d8408519c74d0de46a6f1b1f6edcdcd7e4dfb11338 ips '{}' --abi Ips.abi.json | awk '/Result/,0' |  cut -d':' -f2 | cut -d'{' -f2 | cut -d'}' -f1 &> cIps.json

#delete previous data
tonos-cli --url $network call $contract clean "{}" --abi GeoIp.abi.json --sign GeoIp.keys.json

#uploda new data
sample=$(cat cIps.json)
JSON_STRING='['
i=1
for ip in $(echo "${sample}" | jq -r '.[]'); do
      response=("$(curl -f -s -S -k http://localhost:8080/${ip})") 
      lat=$(echo ${response} | jq '.latitude')
      long=$(echo ${response} | jq '.longitude')
      asnOrganization=$(echo ${response} | jq '.asnOrganization')
      JSON_STRING=''"$JSON_STRING"'{"lat":'"$lat"',"long":'"$long"',"asnOrganization":'"$asnOrganization"',"ip":"'"$ip"'"}'      
echo $i
i=$(($i+1))  
 if (($i % 50 == 0)); then    
    JSON_STRING=''"$JSON_STRING"']'
    echo $JSON_STRING
    tonos-cli --url $network call $contract addChunk "{\"p\":$(echo ${JSON_STRING})}" --abi GeoIp.abi.json --sign GeoIp.keys.json
    JSON_STRING='['
 else
    JSON_STRING=''"$JSON_STRING"',' 
 fi 
  
done
JSON_STRING=$(echo ${JSON_STRING::-1})
JSON_STRING=''"$JSON_STRING"']'
tonos-cli --url $network call $contract addChunk "{\"p\":$(echo ${JSON_STRING})}" --abi GeoIp.abi.json --sign GeoIp.keys.json


#view result of performed work
tonos-cli --url $network run $contract countNodes '{}' --abi GeoIp.abi.json