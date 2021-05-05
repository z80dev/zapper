// We require the Hardhat Runtime Environment explicitly here. This is optional 
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const { ethers } = require("hardhat");

const SUSHI = "0x84311ecc54d7553378c067282940b0fdfb913675"
const WFTM = "0x21be370d5312f44cb42ce377bc9b8a0cef1a4c83"
const WBNB = "0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c"

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile 
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  const Zap = await ethers.getContractFactory("MilZap");
  const zap = await Zap.deploy(WFTM);

  await zap.deployed();

  console.log("MilZap deployed to:", zap.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
