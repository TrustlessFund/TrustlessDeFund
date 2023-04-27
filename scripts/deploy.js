async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  console.log("Account balance:", (await deployer.getBalance()).toString());

  const Data = await ethers.getContractFactory("contract");
  const data = await Data.connect(deployer).deploy("TestToken","TT");
  await data.deployed();
  console.log("Data Deployed~!")
  console.log("DATA Contract address:", data.address);
} 

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
  //npx hardhat run scripts/deploy.js --network mumbai