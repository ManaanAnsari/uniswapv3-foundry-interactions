# Foundry and Uniswap Interactions

Test and interact with Uniswap using Foundry and mainnet fork.

### Installation

```bash
forge install https://github.com/OpenZeppelin/openzeppelin-contracts --no-commit
forge install https://github.com/Uniswap/v3-periphery --no-commit
forge install https://github.com/Uniswap/v3-core --no-commit
```

### Setting Up

Open a new terminal and run the mainnet fork. Make sure you create a `.env` file from the provided template.

```bash
source .env
anvil --fork-url $ETHMAINNET_RPC_URL
```

### Building the Project

Run the build command to check if everything is working.

```bash
forge build
```

### Running Tests

Run all the tests:

```bash
forge test --rpc-url 127.0.0.1:8545 -vvv
```

Run individual tests:

```bash
forge test --mt test_swapExactInputSingleHop --rpc-url 127.0.0.1:8545 -vvv
```
