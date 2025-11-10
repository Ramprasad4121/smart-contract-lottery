# Smart Contract Lottery

<!-- <div align="center">
  <a href="https://github.com/Ramprasad4121/smart-contract-lottery">
    <img src="docs/images/lottery-banner.png" alt="Lottery Banner" width="600" height="300">
  </a>
</div> -->

<div align="center">
  Decentralized Lottery with Chainlink VRF & Automation
  <br />
  <a href="#about"><strong>Explore the demo »</strong></a>
  <br />
  <br />
  <a href="https://github.com/Ramprasad4121/smart-contract-lottery/issues/new?assignees=&labels=bug&template=01_BUG_REPORT.md&title=bug%3A+">Report a Bug</a>
  ·
  <a href="https://github.com/Ramprasad4121/smart-contract-lottery/issues/new?assignees=&labels=enhancement&template=02_FEATURE_REQUEST.md&title=feat%3A+">Request a Feature</a>
  ·
  <a href="https://github.com/Ramprasad4121/smart-contract-lottery/issues/new?assignees=&labels=question&template=04_SUPPORT_QUESTION.md&title=support%3A+">Ask a Question</a>
</div>

<div align="center">
<br />

[![Solidity](https://img.shields.io/badge/Solidity-^0.8.20-blue)](https://soliditylang.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-green)](LICENSE)

</div>

<details open="open">
<summary>Table of Contents</summary>

- [Smart Contract Lottery](#smart-contract-lottery)
  - [About](#about)
    - [Built With](#built-with)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [Usage](#usage)
    - [Local Development](#local-development)
    - [Testnet Deployment (Sepolia)](#testnet-deployment-sepolia)
    - [Testing](#testing)
    - [Interactions](#interactions)
    - [Other Commands](#other-commands)
  - [Roadmap](#roadmap)
  - [Support](#support)
  - [Project Assistance](#project-assistance)
  - [Contributing](#contributing)
  - [Authors \& Contributors](#authors--contributors)
  - [Security](#security)
  - [License](#license)
  - [Acknowledgements](#acknowledgements)

</details>

---

## About

A decentralized lottery smart contract on Ethereum. Users enter by sending 0.1 ETH; Chainlink VRF ensures fair random winner selection, automated via Chainlink Automation. Built for secure, verifiable lotteries with Foundry for easy testing and deployment.

Why this? To demonstrate Chainlink integrations for randomness and automation in a gamified dApp.

<!-- <details>
<summary>Screenshots</summary>
<br>

|                               Local Deployment Console                               |                               Enter Raffle Transaction                               |
| :-------------------------------------------------------------------: | :--------------------------------------------------------------------: |
| <img src="docs/images/deploy-local.png" title="Anvil Deployment" width="100%"> | <img src="docs/images/enter-raffle.png" title="Enter Raffle" width="100%"> |

> Add screenshots of `make deploy` output and `cast send` transaction.

</details> -->

### Built With

- [Foundry](https://book.getfoundry.sh/) – Forge, Cast, Anvil
- [Chainlink VRF & Automation](https://chain.link/) – Randomness & upkeep
- Solidity ^0.8.20
- [Make](https://www.gnu.org/software/make/) – Task automation

## Getting Started

### Prerequisites

- Git (`git --version`)
- Foundry (`curl -L https://foundry.paradigm.xyz | bash && foundryup`; `forge --version`)

### Installation

1. Clone the repo:
   ```bash
   git clone https://github.com/Ramprasad4121/smart-contract-lottery.git
   cd smart-contract-lottery
   ```

2. Build:
   ```bash
   forge build
   ```

3. Install Chainlink libs (optional):
   ```bash
   forge install smartcontractkit/chainlink-brownie-contracts@0.6.1 --no-commit
   ```

4. Copy `.env.example` to `.env` and set vars: `PRIVATE_KEY`, `SEPOLIA_RPC_URL`, `ETHERSCAN_API_KEY` (optional).

## Usage

### Local Development

- Start Anvil:
  ```bash
  make anvil
  ```

- Deploy:
  ```bash
  make deploy
  ```

### Testnet Deployment (Sepolia)

1. Get test ETH: [Chainlink Faucet](https://faucets.chain.link/).
2. Deploy:
   ```bash
   make deploy ARGS="--network sepolia"
   ```
   *Auto-creates VRF subscription; update in `scripts/HelperConfig.s.sol` if reusing.*

3. Register Automation: Visit [Chainlink Automation](https://automation.chain.link/new), select "Custom logic".

### Testing

- Unit tests:
  ```bash
  forge test
  ```

- Forked tests:
  ```bash
  forge test --fork-url $SEPOLIA_RPC_URL
  ```

- Coverage:
  ```bash
  forge coverage --report lcov
  ```

### Interactions

- Enter raffle (0.1 ETH):
  ```bash
  cast send <CONTRACT_ADDRESS> "enterRaffle()" --value 0.1ether --private-key $PRIVATE_KEY --rpc-url $SEPOLIA_RPC_URL
  ```

- Create VRF subscription:
  ```bash
  make createSubscription ARGS="--network sepolia"
  ```

### Other Commands

- Format: `forge fmt`
- Gas snapshot: `forge snapshot`
- Clean: `make clean`

## Roadmap

See [open issues](https://github.com/Ramprasad4121/smart-contract-lottery/issues) for features and bugs.

- [Top Enhancements](https://github.com/Ramprasad4121/smart-contract-lottery/issues?q=label%3Aenhancement+is%3Aopen+sort%3Areactions-%2B1-desc) (👍 vote)
- [Top Bugs](https://github.com/Ramprasad4121/smart-contract-lottery/issues?q=is%3Aissue+is%3Aopen+label%3Abug+sort%3Areactions-%2B1-desc) (👍 vote)

Future: Multi-chain support, frontend UI.

## Support

- [GitHub Issues](https://github.com/Ramprasad4121/smart-contract-lottery/issues/new?assignees=&labels=question&template=04_SUPPORT_QUESTION.md&title=support%3A+)
- [X](https://x.com/0xramprasad) – Quick queries

## Project Assistance

- ⭐ [Star](https://github.com/Ramprasad4121/smart-contract-lottery)
- Tweet: "Fair lottery with Chainlink VRF! #Ethereum #Solidity"
- Blog on [Dev.to](https://dev.to/)

## Contributing

Fork, create branch (`git checkout -b feature/xyz`), commit, PR. See [CONTRIBUTING.md](docs/CONTRIBUTING.md).

## Authors & Contributors

- [Ramprasad4121](https://github.com/Ramprasad4121)

See [contributors](https://github.com/Ramprasad4121/smart-contract-lottery/contributors).

## Security

Uses audited Chainlink code; review for production. Report via [SECURITY.md](docs/SECURITY.md). Provided "as is."

## License

MIT License. See [LICENSE](LICENSE).

## Acknowledgements

- [Chainlink](https://chain.link/) – VRF & Automation
- [Foundry](https://getfoundry.sh/) – Development toolkit
- Ethereum community inspirations.