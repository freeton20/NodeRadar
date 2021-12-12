const { client } = require("./client/webClient");
const { Account } = require("@tonclient/appkit");
const config = require("./config");

const fetch = require('cross-fetch');

const getIps = async () => {
    const contractData = require("./contracts/ContractData.json");
    try {
        const account = new Account(contractData, { address: config.contract, client });
        const response = await account.runLocal("ips", {});
        return response.decoded.output.ips;
    } catch (e) {
        console.log(`response is: ${JSON.stringify(e, null, 4)}`);
    }
};

const getIpsFromCache = async () => {
    const contractData = require("./contracts/GeoIpContractData.json");
    try {
        const account = new Account(contractData, { address: config.contractGeoIp, client });
        const response = await account.runLocal("coords", {});
        let points = response.decoded.out_messages[0].value.coords.map(p => {
            return {
                latitude: p.lat,
                longitude: p.long,
                asnOrganization: p.asnOrganization
            }
        })
        points = points.filter(p => {
            return p.ip !== '109.199.165.33'
        });
        return points;
    } catch (e) {
        console.log(`response is: ${JSON.stringify(e, null, 4)}`);
    }
};

const geoIp = async () => {
    if(config.getFromCache == true){
        return await getIpsFromCache();
    }
    let ips = await getIps();
    ips = ips.filter(ip => {
        return ip !== '109.199.165.33'
    });
    const points = await Promise.all(
        ips.map(ip => {
            let url = `${config.geoIp}${ip}/`;
            return fetch(url)
                .then(response => response.json())
                .catch(() => undefined);
        })
    ).then(resp => {
        return resp.map((point) => {
            return point;
        });
    }).catch(e => {
        console.log(e);
    })

    return points.filter(point => {
        return point !== undefined;
    });
}

module.exports = {
    geoIp
}

