const { client } = require("./client/webClient");
const { Account } = require("@tonclient/appkit");
const contractData = require("./contracts/ContractData.json");
const config = require("./config");

const fetch = require('cross-fetch');

const getIps = async () => {
    try {
        const account = new Account(contractData, { address: config.contract, client });
        const response = await account.runLocal("ips", {});
        return response.decoded.output.ips;
    } catch (e) {
        console.log(`response is: ${JSON.stringify(e, null, 4)}`);
    }
};

const geoIp = async () => {
    let ips = await getIps();

    const points = await Promise.all(
        ips.map(ip => {
            let url = `${config.geoIp}${ip}`;
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

