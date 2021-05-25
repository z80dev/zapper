//
// SPDX-License-Identifier: UNLICENSED
//
pragma solidity ^0.8.4;
pragma experimental ABIEncoderV2;

import '@uniswap/v2-core/contracts/interfaces/IERC20.sol';
import "@openzeppelin/contracts/access/Ownable.sol";

import "./WithdrawHelper.sol";
import "./IZap.sol";

contract VaultZapWithdrawHelper is WithdrawHelper, Ownable {

  struct VaultZapData {
    address zapper;
    address from;
    address to;
    address router;
    address vault;
    address recipient;
  }

  function getCallData(
    VaultZapData calldata vaultZapData
  ) public pure returns (bytes memory) {
    return abi.encode(vaultZapData);
  }

  function execute(WithdrawData calldata wd, uint256 actualAmount) override external {
    VaultZapData memory vaultZapData = abi.decode(wd.callData, (VaultZapData));

    if (vaultZapData.from != address(0)) {
      require(IERC20(vaultZapData.from).approve(vaultZapData.zapper, actualAmount), "UniswapWithdrawHelper: tokenA approve failed.");
    }

    IZap(vaultZapData.zapper).zapInTokenToVault(
        vaultZapData.from,
        actualAmount,
        vaultZapData.to,
        vaultZapData.router,
        vaultZapData.vault,
        vaultZapData.recipient
      );
  }
    /* ========== RESTRICTED FUNCTIONS ========== */

    function withdraw(address token) external onlyOwner {
        if (token == address(0)) {
            payable(owner()).transfer(address(this).balance);
            return;
        }

        IERC20(token).transfer(owner(), IERC20(token).balanceOf(address(this)));
    }
}

