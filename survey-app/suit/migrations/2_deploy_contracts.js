const Fighting = artifacts.require("./Fighting.sol");

module.exports = function (deployer) {
    deployer.deploy(Fighting);
}