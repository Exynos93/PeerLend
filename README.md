# PeerLend
A decentralized, scalable peer-to-peer lending platform on Ethereum, featuring advanced loan management, multi-collateral support, and a user-friendly interface with real-time analytics. 

# Key Features:
Complex Loan Structuring: Support for fixed and variable interest rates, collateralized and uncollateralized loans, and multi-currency support.
Oracle Integration: Use of multiple data feeds for price and risk assessment.
Risk Management: Automated liquidation mechanisms and credit scoring.
Governance: On-chain governance for platform updates and parameter adjustments.
Scalability: Layer 2 solutions for scalability like Optimism or Arbitrum.

# Prerequisites:
Node.js (v14+) and npm (v7+)
Solidity compiler (v0.8.13 or higher)
Hardhat for smart contract development and testing
Ethers.js for frontend blockchain interactions
React for a more interactive frontend
TypeScript for type-safe JavaScript
Docker for consistent development environments
Graph Protocol for indexing and querying blockchain events
Chainlink for decentralized oracles
IPFS for decentralized storage of loan agreements

#Instructions
1. Clone the Repository:

git clone git@github.com:yourusername/PeerLend.git
cd PeerLend

2. Install Dependencies:
npm install

3. Run Docker Containers:
docker-compose up --build

4. Deploy Contracts:
- Configure your hardhat.config.ts for your network settings.
- Run npx hardhat deploy --network <network-name> to deploy contracts.

5. Start the Frontend:
npm run start

6. Interact with the DApp:
- Connect your wallet (e.g., MetaMask) to the correct network.
- Navigate through the UI to perform actions like depositing, lending, borrowing, and participating in governance.

7. Explore Analytics:
Check out the analytics dashboard for insights into the platform's performance, risk metrics, and user activity.
