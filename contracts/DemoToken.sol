// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title DemoToken
/// @notice ERC20 token with transfer fee, demonstrates consultant oversight

contract DemoToken is ERC20, Ownable {
    uint256 public feePercent = 1; // 1% transfer fee
    address public feeCollector;    // Address to collect fees

    constructor() ERC20("Demo Token", "DMT") {
        _mint(msg.sender, 1_000_000 * 10**decimals());
        feeCollector = msg.sender;
    }

    function setFeeCollector(address _collector) external onlyOwner {
        feeCollector = _collector;
    }

    function setFeePercent(uint256 _percent) external onlyOwner {
        require(_percent <= 10, "Fee too high");
        feePercent = _percent;
    }

    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal override {
        uint256 fee = (amount * feePercent) / 100;
        uint256 amountAfterFee = amount - fee;

        super._transfer(sender, feeCollector, fee);
        super._transfer(sender, recipient, amountAfterFee);
    }
}
