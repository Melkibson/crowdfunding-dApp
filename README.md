# Crowdfunding App - Back End

This project is a decentralized crowdfunding application built using Thirdweb, Hardhat, and Solidity. 
Users can create, browse, and donate to crowdfunding campaigns on the Ethereum blockchain.

## Installation

Before you start, make sure you have Node.js and npm installed.

1. Clone the repository:
   
https://github.com/Melkibson/crowdfunding-dApp.git

2. Create a `.env` file in the root of the directory and set the `PRIVATE_KEY` variable to your private key:

PRIVATE_KEY=<your_private_key>

## Compiling the smart contract

To compile the smart contract, run:

npx hardhat compile


## Deploying the smart contract

To deploy the smart contract to a test network, run:

npx hardhat run scripts/deploy.js --network <your_network>


Replace `<your_network>` with the desired test network (e.g., `goerli`).

## Running tests

To run the smart contract tests, run:

npx hardhat test
