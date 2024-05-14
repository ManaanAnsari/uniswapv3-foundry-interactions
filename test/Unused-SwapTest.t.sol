// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.24;

// import {Test, console} from "forge-std/Test.sol";
// import {ISwapRouter} from "@uniswap-periphery/contracts/interfaces/ISwapRouter.sol";
// import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// import {HelperConfig} from "../script/HelperConfig.s.sol";

// contract SwapTest is Test {
//     HelperConfig helperConfig;
//     // the router address
//     ISwapRouter router;
//     //  the router interface
//     // token 1 address (weth)
//     IERC20 weth;
//     // token 2 address (dai)
//     IERC20 dai;
//     // create a user
//     address public USER = makeAddr("user");

//     function setUp() external {
//         // mint some test tokens on a user
//         helperConfig = new HelperConfig();
//         (address _router, address _weth, address _dai) = helperConfig.activeNetworkConfig();
//         router = ISwapRouter(_router);
//         weth = IERC20(_weth);
//         dai = IERC20(_dai);
//         // give some tokens to the user
//         deal(address(weth), USER, 5 * 1e18, false);
//         deal(address(dai), USER, 1e4 * 1e18, true);
//         vm.deal(USER, 1 ether);
//     }

//     function testSwap() external {
//         assertTrue(true);
//         vm.startPrank(USER);
//         // approve the router to spend the tokens
//         weth.approve(address(router), 1 * 1e18);
//         vm.stopPrank();
//         // do the swap
//         ISwapRouter.ExactInputSingleParams memory params = ISwapRouter.ExactInputSingleParams({
//             tokenIn: address(weth),
//             tokenOut: address(dai),
//             fee: 3000,
//             recipient: USER,
//             deadline: block.timestamp,
//             amountIn: 1 * 1e18,
//             amountOutMinimum: 0,
//             sqrtPriceLimitX96: 0
//         });

//         router.exactInputSingle(params);

//         // check the balance of the user
//         assertTrue(dai.balanceOf(USER) > 1e4 * 1e18);
//         assertTrue(weth.balanceOf(USER) == 4 * 1e18);
//         console.log(dai.balanceOf(USER), "dai balance of user");
//     }
// }
