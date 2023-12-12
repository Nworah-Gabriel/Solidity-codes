const { expect } = require("chai");

describe("MyContracts", function(){

    it("Checks that the contract name deployed is correct", async function(){
        const MyContracts = await hre.ethers.getContractFactory("CertificateNFT");
        const myContractDeployed = await MyContracts.deploy("CertificateNFT", "NFT");
        await myContractDeployed.deployed();
        expect(await myContractDeployed.name()).to.equal("CertificateNFT");
        expect(await myContractDeployed.symbol()).to.equal("NFT");
        expect(await myContractDeployed.mintCertificate("0x532354D85920702C461C59B33b14911D8D1b97F5", 0, "ipfs://bafkreih6lb4abox5c5ebphblr6cgrrucihpsmfasl7lugjb5yw3jevnaoe")).to.equal("nft token minted successfully");
    })
})
