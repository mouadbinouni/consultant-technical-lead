# consultant-technical-lead

This repository demonstrates my **consultant/technical lead skills**:

- Supervising Solidity developers
- Validating contract logic
- Translating Python logic to Solidity
- Ensuring secure, production-ready smart contracts

## Contracts
### DemoToken.sol
ERC20 token with transfer fee
### DemoStaking.sol
Simple staking contract, mirrors Python logic
## Test Vectors
`test_vectors.json` contains inputs/outputs for validation
## Python Validation
Use `validate_rewards.py` to simulate Solidity staking logic
## Migration Flowchart
![Migration Flow](flowchart.png)

## Usage
1. Review contracts
2. Deploy/verify on Sepolia
3. Run `validate_rewards.py` to check Python -> Solidity match
