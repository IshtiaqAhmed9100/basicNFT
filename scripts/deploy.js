const { ethers } = require("hardhat");
const { run } = require("hardhat");
async function verify(address, constructorArguments) {
    console.log(`verify  ${address} with arguments ${constructorArguments.join(',')}`)
    await run("verify:verify", {
        address,
        constructorArguments
    })
}
async function main() {
  let owner =  '0x12eF0F1C99D8FD50fFd37cCd12B09Ef7f1213269';
   
  const QueckoNft = await ethers.deployContract( 'QueckoNft' , [owner]);

    console.log("Deploying QueckoNft...");
    await QueckoNft.waitForDeployment()

    console.log("QueckoNft deployed to:", QueckoNft.target);

    await new Promise(resolve => setTimeout(resolve, 10000));
    verify('0x0B350598BDD17eD73253A499308cE404fBCd1EA3', [owner])
}
main()