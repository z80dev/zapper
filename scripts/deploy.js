// We require the Hardhat Runtime Environment explicitly here. This is optional 
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const { ethers } = require("hardhat");

const SUSHI = "0x84311ecc54d7553378c067282940b0fdfb913675"
const WFTM = "0x21be370d5312f44cb42ce377bc9b8a0cef1a4c83"
const TWFTM = "0xf1277d1ed8ad466beddf92ef448a132661956621"
const WMATIC = "0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270"

const WBNB = "0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c"

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile 
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  const Zap = await ethers.getContractFactory("Zap");
  const zap = await Zap.deploy(WFTM);

  console.log("New zapper address: ", zap.address);

  console.log("Setting useNativeRouter for hyperswap");

  await zap.setUseNativeRouter("0x53c153a0df7E050BbEFbb70eE9632061f12795fB");

  console.log("Use native for hyperswap: ", await zap.useNativeRouter("0x53c153a0df7E050BbEFbb70eE9632061f12795fB"))

  //await zap.deployed();
  //console.log("Zapper address: ", zap.address)
  ///
  //const LPVaultHelper = await ethers.getContractFactory("LPVaultWithdrawalHelper")
  //const lpHelper = await LPVaultHelper.deploy()

  //await lpHelper.deployed()
  //console.log("LP Vault Helper address: ", lpHelper.address)

  //const SSVaultHelper = await ethers.getContractFactory("SingleSidedVaultWithdrawHelper")
  //const ssHelper = await SSVaultHelper.deploy()

  //await ssHelper.deployed()
  //console.log("SS Vault Helper address: ", ssHelper.address)

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
