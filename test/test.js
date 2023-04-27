const { expect } = require("chai");
const { ethers } = require("hardhat");

const bytes32 = require('bytes32');

const baseSize = 1000000;

describe("Trustlesss fund", function () {
  it("bad news", async function () {
    const [owner, addr1 ,addr2,addr3,addr4,addr5,addr6] = await ethers.getSigners();
    console.log("begian")

    const Token = (await ethers.getContractFactory("keyToken"));
    const token = await Token.connect(addr1).deploy("KT","keyToken");
    await token.deployed();
    console.log("🍺Init the testing keyToken : "+token.address);

  });
});
