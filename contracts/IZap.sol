// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IZap {
    function zapOut(address _from, uint amount, address _recipient) external;
    function zapOutToken(address _from, uint amount, address _to, address routerAddr, address _recipient) external;
    function zapIn(address _to, address _recipient) external payable;
    function zapInToken(address _from, uint amount, address _to, address _recipient) external;
    function zapInTokenToVault(address _from, uint amount, address _to, address routerAddr, address _vault, address _recipient) external;
    function zapInToVault(address _to, address routerAddr, address _vault, address _recipient) external payable;
    function zapAcross(address _from, uint amount, address _fromRouter, address _toRouter, address _recipient) external;
}
