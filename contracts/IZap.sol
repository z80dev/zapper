// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

interface IZap {
    function zapOut(address _from, uint amount) external;
    function zapOutToken(address _from, uint amount, address _to, address routerAddr) external;
    function zapIn(address _to) external payable;
    function zapInToken(address _from, uint amount, address _to) external;
    function zapInTokenToVault(address _from, uint amount, address _to, address routerAddr, address _vault) external;
    function zapInToVault(address _to, address routerAddr, address _vault) external payable;
    function zapInToFarm(address _to, address routerAddr, address _masterChef, uint _pid) external payable;
    function zapAcross(address _from, uint amount, address _fromRouter, address _toRouter) external;
}
