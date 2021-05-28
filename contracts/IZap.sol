// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IZap {
    function zapIn(address _to, address routerAddr, address _recipient) external payable;
    function zapInToLPVault(address _to, address routerAddr, address _vault, address _recipient) external payable;
    function zapInToSingleSidedVault(address _to, address routerAddr, address _vault, address _recipient) external payable;
    function zapInToken(address _from, uint amount, address _to, address routerAddr, address _recipient) external;
    function zapInTokenToLPVault(address _from, uint amount, address _to, address routerAddr, address _vault, address _recipient) external;
    function zapInTokenToSingleSideVault(address _from, uint amount, address _to, address routerAddr, address _vault, address _recipient) external;
    function zapAcross(address _from, uint amount, address _toRouter, address _recipient) external;
    function zapOut(address _from, uint amount, address routerAddr, address _recipient) external;
    function zapOutToken(address _from, uint amount, address _to, address routerAddr, address _recipient) external;
}
