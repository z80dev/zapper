//
// SPDX-License-Identifier: UNLICENSED
//
pragma solidity ^0.8.4;
pragma experimental ABIEncoderV2;

import '@uniswap/v2-core/contracts/interfaces/IERC20.sol';
import "@openzeppelin/contracts/access/Ownable.sol";

import "./WithdrawHelper.sol";
import "./IZap.sol";

contract ZapInWithdrawHelper is WithdrawHelper, Ownable {

  struct ZapInData {
    address zapper;
    address from;
    address to;
    address router;
    address recipient;
  }

  function getCallData(
    ZapInData calldata vaultZapData
  ) public pure returns (bytes memory) {
    return abi.encode(vaultZapData);
  }

  function execute(WithdrawData calldata wd, uint256 actualAmount) override external {
    ZapInData memory zapInData = abi.decode(wd.callData, (ZapInData));

    if (zapInData.from != address(0)) {
      require(IERC20(zapInData.from).approve(zapInData.zapper, actualAmount), "UniswapWithdrawHelper: tokenA approve failed.");
    }

    IZap(zapInData.zapper).zapInToken(
        zapInData.from,
        actualAmount,
        zapInData.to,
        zapInData.router,
        zapInData.recipient
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

