async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  console.log("Account balance:", (await deployer.getBalance()).toString());

  const Token = (await ethers.getContractFactory("keyToken"));
  const token = await Token.connect(deployer).deploy("TrustlessFundToken","TFD");
  await token.deployed();
  console.log("🍺Init the testing keyToken : "+token.address);

    
} 

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
  //npx hardhat run scripts/deployTF.js --network mumbai