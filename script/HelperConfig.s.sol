// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";

contract HelperConfig is Script {
    struct NetworkConfig {
        address router;
        address weth;
        address dai;
    }

    NetworkConfig public activeNetworkConfig;

    constructor() {
        if (block.chainid == 1) {
            activeNetworkConfig = getEthConfig();
        } else {
            activeNetworkConfig = getOrCreateAnvilNetworkConfig();
        }
    }

    function getEthConfig() public view returns (NetworkConfig memory) {
        return NetworkConfig({
            router: 0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45,
            weth: 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2,
            dai: 0x6B175474E89094C44Da98b954EedeAC495271d0F
        });
    }

    function getOrCreateAnvilNetworkConfig() public returns (NetworkConfig memory) {
        // revert("Not implemented");
        return NetworkConfig({
            router: 0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45,
            weth: 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2,
            dai: 0x6B175474E89094C44Da98b954EedeAC495271d0F
        });
    }
}
