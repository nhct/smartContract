const NHCTToken = artifacts.require("NHCTToken");

module.exports = function(deployer) {
    deployer.deploy(NHCTToken).then(() => {
        console.log("NHCTToken contract address is: ", NHCTToken.address)
    });
}