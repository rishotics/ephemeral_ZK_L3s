import { HardhatUserConfig } from 'hardhat/config'
import '@nomicfoundation/hardhat-toolbox'

const config: HardhatUserConfig = {
  solidity: '0.8.18',
  paths: {
    sources: './src',
    tests: './test',
    cache: './build/cache',
    artifacts: './build/artifacts',
  },
  typechain: {
    outDir: 'build/typechain',
  },
//   defaultNetwork: 'localhost',
  networks: {
    
    polygonZkEVM: {
      url: 'https://rpc.public.zkevm-test.net',
      accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : []
  },
  gnosis: {
    url: `https://rpc.chiado.gnosis.gateway.fm/`,
    accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : []
  },
  arbitrum: {
    url: 'https://stylus-testnet.arbitrum.io/rpc',
    chainId: 23011913,
    accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : []
  },
  scrollSepolia: {
    url: "https://sepolia-rpc.scroll.io/" || "",
    accounts:
      process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
  },
  linea: {
    url: "https://linea-mainnet.infura.io/v3/",
    chainId: 59144,
    accounts:
      process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
  },
  chiliz:{
    url: "https://spicy-rpc.chiliz.com/",
    chainId: 88882,
    accounts:
      process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
  },
  alfajores: { //celo
    url: "https://alfajores-forno.celo-testnet.org",
    accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    chainId: 44787
  },
  mantle: {
    url: "https://rpc.testnet.mantle.xyz/",
    chainId: 5001,
    accounts:
      process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
  },
  celestia: {
    url: "https://bubs.calderachain.xyz/http",
    chainId: 1582,
    accounts:
      process.env.PRIVATE_KEY !== undefined ? ['16add946c12b9d3fadaa2adb22190cf89682b813920cfc599f5e84547b297506'] : [],
  },
}
}

export default config
