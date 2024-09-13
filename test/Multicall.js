const { ethers } = require("hardhat");

describe("multicall", function () {
    it("multicall", async function () {

        const [caller] = await ethers.getSigners();

        const Multicall = await ethers.getContractFactory("Multicall");
        const Airdrop = await ethers.getContractFactory("Airdrop");

        let airdrop = await Airdrop.deploy()
        let multicall = await Multicall.deploy()

        console.log('caller', caller.address)
        console.log('airdrop', airdrop.address)
        console.log('multicall', multicall.address)

        await airdrop.setWhitelist(caller.address)

        await airdrop.airdrop()

        await multicall.aggregate([{
            target: airdrop.address,
            callData: Airdrop.interface.encodeFunctionData("airdrop"),
        }])

    });
});