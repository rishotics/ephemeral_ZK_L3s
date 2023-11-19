/* eslint-disable */

import { ethers } from "ethers";
import gameAbi from '../abi/game.json';

const GAME_CONTRACT_ADDRESS = '0x5FbDB2315678afecb367f032d93F642f64180aa3';

export const getGameContract = (signer: ethers.Signer) => new ethers.Contract(GAME_CONTRACT_ADDRESS, gameAbi.abi, signer);


