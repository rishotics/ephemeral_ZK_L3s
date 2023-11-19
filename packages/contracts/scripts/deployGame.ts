// import net from 'node:net'
import hre, { ethers } from 'hardhat'

async function main(): Promise<void> {
    if (hre.network.name === 'hardhat') {
      // If we don't provide a network, hardhat will create a new one, we will
      // deploy our contract to that node but once this function finishes
      // the node is stopped. We want to have a node that keeps on
      // running, so if we say the node is on the hardhat network, manually
      // start a new one that won't shutdown after the contract is
      // deployed.
    //   await startPerpetualHardhatNode()
    }
  
    const gameFactory = await ethers.getContractFactory('Game')
    const game = await gameFactory.deploy()
    await game.deployed()
  
    console.log(`Game deployed to ${game.address}`)
  }

main().catch((error) => {
    console.error(error)
    process.exit(1)
  })
  