const { expect } = require("chai");
const { ethers } = require("hardhat");

const bytes32 = require('bytes32');

const baseSize = 1000000;

describe("Sub Contract Deploy Test", function () {
  it("bad news", async function () {
    const [owner, addr1 ] = await ethers.getSigners();
    console.log("begian")

    const SubDeploy = (await ethers.getContractFactory("subContractDeployTest"));
    const subDeploy = await SubDeploy.connect(addr1).deploy();
    await subDeploy.deployed();
    console.log("🍺Sub Contract Deploy : "+subDeploy.address);
    console.log("Contract List" ,await subDeploy.getContractCount())
    await subDeploy.newContract()
    console.log("deploy new contract")
    console.log("Contract List" ,await subDeploy.getContractCount())
    var list =await subDeploy.getContractCount();
    const nc = (await await ethers.getContractAt("subContract",list[0]))
    console.log("The sth settle",await nc.get())
    await nc.set("Well . it should work ");
    console.log("The sth settle",await nc.get())
  });
});
