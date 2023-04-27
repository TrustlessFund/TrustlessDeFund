async function main() {
    const [deployer] = await ethers.getSigners();
  
    console.log("Testing account:", deployer.address);
  
    console.log("Account balance:", (await deployer.getBalance()).toString());
  
    dataContract = await ethers.getContractAt("core","");
    tokenContract = await ethers.getContractAt("ERC20","");
    explorerContract = await ethers.getContractAt("explorer","")

    await tokenContract.approve("",10000000000);
    console.log("🔥approve token")


    await dataContract.action(
    );
    
  } 
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
    //npx hardhat run scripts/mumbaiTF.js --network mumbai