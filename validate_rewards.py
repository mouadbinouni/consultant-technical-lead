import json

with open("test_vectors.json") as f:
    test_vectors = json.load(f)

DECIMALS = 1e18

def calculate_rewards(amount, reward_rate, blocks):
    return amount * reward_rate * blocks / DECIMALS

print("Python -> Solidity reward validation\n")
for vector in test_vectors:
    user = vector["user"]
    staked_amount = vector["staked_amount"]
    reward_rate = vector["reward_rate"]
    blocks = vector["blocks"]
    expected = vector["expected_reward"]

    reward = calculate_rewards(staked_amount, reward_rate, blocks)

    print(f"User: {user}")
    print(f"  Staked: {staked_amount}, Blocks: {blocks}, Rate: {reward_rate}")
    print(f"  Expected Reward: {expected}, Calculated Reward: {reward}")
    print(f"  Match: {'✅' if abs(reward - expected) < 1e-8 else '❌'}\n")
