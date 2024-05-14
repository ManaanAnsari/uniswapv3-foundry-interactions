// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {IQuoterV2} from "@uniswap-periphery/contracts/interfaces/IQuoterV2.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract QuoterTest is Test {
    address constant QUOTER = 0x61fFE014bA17989E743c5F6cB21bF9697530B21e;
    address private constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address private constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    IQuoterV2 private quoter = IQuoterV2(QUOTER);

    function setUp() public {
        // do nothing
    }

    function testSingleinputQuote() public {
        assertTrue(true);
        IQuoterV2.QuoteExactInputSingleParams memory params = IQuoterV2.QuoteExactInputSingleParams({
            tokenIn: DAI,
            tokenOut: WETH,
            fee: 3000,
            amountIn: 1e18,
            sqrtPriceLimitX96: 0
        });
        (uint256 amountOut, uint160 sqrtPriceX96After, uint32 initializedTicksCrossed, uint256 gasEstimate) =
            quoter.quoteExactInputSingle(params);
        console.log(amountOut, "amountOut");
        console.log(sqrtPriceX96After, "sqrtPriceX96After");
        console.log(initializedTicksCrossed, "initializedTicksCrossed");
        console.log(gasEstimate, "gasEstimate");
    }

    function testSingleOutputQuote() public {
        assertTrue(true);
        IQuoterV2.QuoteExactOutputSingleParams memory params = IQuoterV2.QuoteExactOutputSingleParams({
            tokenIn: DAI,
            tokenOut: WETH,
            fee: 3000,
            amount: 1e18,
            sqrtPriceLimitX96: 0
        });
        (uint256 amountIn, uint160 sqrtPriceX96After, uint32 initializedTicksCrossed, uint256 gasEstimate) =
            quoter.quoteExactOutputSingle(params);
        console.log(amountIn, "amountIn");
        console.log(sqrtPriceX96After, "sqrtPriceX96After");
        console.log(initializedTicksCrossed, "initializedTicksCrossed");
        console.log(gasEstimate, "gasEstimate");
    }

    function testPathOutputQuote() public {
        assertTrue(true);
        // tokenAddress - fee - tokenAddress - fee - tokenAddress
        bytes memory path = abi.encodePacked(WETH, uint24(3000), USDC, uint24(100), DAI);
        (
            uint256 amountIn,
            uint160[] memory sqrtPriceX96AfterList,
            uint32[] memory initializedTicksCrossedList,
            uint256 gasEstimate
        ) = quoter.quoteExactOutput(path, 1e18);
        console.log(amountIn, "amountIn");
        console.log(gasEstimate, "gasEstimate");
    }
}
