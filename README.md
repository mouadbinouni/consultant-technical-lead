# Consultant Technical Lead

This repository shows my work as a **Blockchain Developer, Consultant, and Technical Lead** for migrating Python logic to Solidity smart contracts. It contains ERC20 and staking contracts, Python validation scripts, test vectors, and flowcharts that explain the migration and validation process.

---

## Contents

- **contracts/**  
  - `DemoToken.sol` — ERC20 token with a transfer fee  
  - `DemoStaking.sol` — Staking contract with reward calculation

- **test_vectors.json** — Sample inputs and expected outputs for validation

- **validate_rewards.py** — Python script to check that Solidity results match Python calculations

- **flowchart.png** — Validation Flow (Python → Test Vectors → Solidity → Integration)

- **migration_flow.png** — On-chain vs Off-chain Logic Flow

- **README.md** — This file

---

## Flowcharts

### Validation Flow
Python logic (buy/sell/staking/bonding curve) → JSON test vectors for 1:1 validation → Solidity contracts (DemoToken.sol, DemoStaking.sol) → Frontend / Backend integration.

![Migration Flow: Python logic (buy/sell/staking/bonding curve) → JSON test vectors for 1:1 validation → Solidity contracts (DemoToken.sol, DemoStaking.sol) → Frontend / Backend integration.](flowchart.png)  
Figure: Validation Flow — Python calculations are converted into structured JSON test vectors, used to verify Solidity outputs before integration.

### Migration Flow
*Python logic (buy/sell/staking/bonding curve) → JSON test vectors for 1:1 validation → Solidity contracts (DemoToken.sol, DemoStaking.sol) → Frontend / Backend integration.*

![Migration Flow: Python logic (buy/sell/staking/bonding curve) → JSON test vectors for 1:1 validation → Solidity contracts (DemoToken.sol, DemoStaking.sol) → Frontend / Backend integration.](migration_flow.png)  
*Figure: Migration Flow — shows which parts of the system should be implemented on-chain vs off-chain, considering security, gas, and transparency.*

---

## Python → Solidity Validation

We use test vectors to ensure 1:1 accuracy between the Python logic and the Solidity contracts.

Run validation locally:
```bash
python validate_rewards.py


