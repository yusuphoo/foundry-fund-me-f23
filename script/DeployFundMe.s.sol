// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        // Before start broadCast --> not a "real" tx

        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPrice = helperConfig.activeNetworkConfig();

        //After start broadcast -->  a real tx
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPrice);
        vm.stopBroadcast();
        return fundMe;
    }
}
