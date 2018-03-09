module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: "7575",
      network_id: "*" // matches to any network ID
    },
    ourTestnet: {
      host: "127.0.0.1",
      port: "8545",
      network_id: "*"
    }
  }
};