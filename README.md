## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

source .env
forge script script/Deploy.s.sol:Deploy --rpc-url zkEVMPolygonTestnet --broadcast --verify --etherscan-api-key ${POLYSCAN_API_KEY} -vvvv

forge create src/v2-core/UniswapV2Factory.sol:UniswapV2Factory --rpc-url zkEVMPolygonTestnet --private-key 'ae839931542e367be1723ff40d18a6111c23bfe9c9320e1bb54a3a9217b6afd1' --constructor-args "0xc0cb694bE0f90a9167e1ff8f2C3FcABdF745EFf9" --verify --etherscan-api-key ${POLYSCAN_API_KEY}

forge create src/v2-periphery/UniswapV2Router02.sol:UniswapV2Router02 --rpc-url zkEVMPolygonTestnet --private-key 'ae839931542e367be1723ff40d18a6111c23bfe9c9320e1bb54a3a9217b6afd1' --constructor-args "0x76a6bb34701516Ec1257B30d182BcEd1a333FEe8" "0x23Be4c7d1040Ff407F5e1d020D8Ee4ed0abBF729" --verify --etherscan-api-key ${POLYSCAN_API_KEY}

forge create src/erc-20-tokens/USDT.sol:USDT --rpc-url zkEVMPolygonTestnet --private-key 'ae839931542e367be1723ff40d18a6111c23bfe9c9320e1bb54a3a9217b6afd1' --constructor-args "0xc0cb694bE0f90a9167e1ff8f2C3FcABdF745EFf9" --verify --etherscan-api-key ${POLYSCAN_API_KEY}

forge create src/erc-20-tokens/WETH.sol:WETH9 --rpc-url zkEVMPolygonTestnet --private-key 'ae839931542e367be1723ff40d18a6111c23bfe9c9320e1bb54a3a9217b6afd1' --verify --etherscan-api-key ${POLYSCAN_API_KEY}

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
