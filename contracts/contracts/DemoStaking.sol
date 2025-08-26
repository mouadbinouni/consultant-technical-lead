// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title DemoStaking
/// @notice Simple staking contract with reward calculation
contract DemoStaking is Ownable {
    IERC20 public stakingToken;
    IERC20 public rewardToken;
    uint256 public rewardRate = 100; // reward per block per token

    struct StakeInfo {
        uint256 amount;
        uint256 rewardDebt; // block number of last reward
    }

    mapping(address => StakeInfo) public stakes;

    constructor(address _stakingToken, address _rewardToken) {
        stakingToken = IERC20(_stakingToken);
        rewardToken = IERC20(_rewardToken);
    }

    function stake(uint256 amount) external {
        require(amount > 0, "Nothing to stake");

        StakeInfo storage stakeData = stakes[msg.sender];

        if (stakeData.amount > 0) {
            uint256 pending = pendingRewards(msg.sender);
            rewardToken.transfer(msg.sender, pending);
        }

        stakingToken.transferFrom(msg.sender, address(this), amount);
        stakeData.amount += amount;
        stakeData.rewardDebt = block.number;
    }

    function withdraw(uint256 amount) external {
        StakeInfo storage stakeData = stakes[msg.sender];
        require(stakeData.amount >= amount, "Not enough staked");

        uint256 pending = pendingRewards(msg.sender);
        rewardToken.transfer(msg.sender, pending);

        stakeData.amount -= amount;
        stakeData.rewardDebt = block.number;

        stakingToken.transfer(msg.sender, amount);
    }

    function pendingRewards(address user) public view returns (uint256) {
        StakeInfo storage stakeData = stakes[user];
        if (stakeData.amount == 0) return 0;

        uint256 blocks = block.number - stakeData.rewardDebt;
        return stakeData.amount * rewardRate * blocks / 1e18;
    }

    function setRewardRate(uint256 _rate) external onlyOwner {
        rewardRate = _rate;
    }
}
