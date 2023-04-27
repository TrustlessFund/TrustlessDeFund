# Trustless fund finance

How to build a decentralize fund with trustless system ? 

It should not be a issue . (Anyway , the risk should be main issue)

**This repo is to build a trustless-c2c-fund protocol with limitation of fund managers and vault keepers.**

## How it works :
Everyone can be a fund manager to set up a new crypto fund (Not only crypto) in this protocol. And everyone can invest it's own token here into the funds that they trust|optimist with .

- Fund Manager
    - Set up new fund
        - Fund Type
        - Token Control Rules
        - Fund Max TVL
    - Control fund usage (Limit access permissions)
        - Follow the token control rules setted before to call up interface.
    - Close fund (if necessary)

- Fund Investor
    - Select a fund with trust | optimist | risk culcution
    - Invest token into it (Stake into it)
    - Unstake token (Harvest)

**Examples**
- Fund Manger
    - Set up new fund (wikisCryptoFund)
        - Fund Type : Mixed
            - $Farm :        70%
            - $Swap :        20%
            - $Leverage :    10%
        - Token Control:
            - Target Token : BTC | ETH | DOGE | MATIC | USDT
            - Base Token : USDT
        - Action Share Public Time :
            - 3600 ms (1 hour) 

        - Control fund usage :
            - Farm 50% tokens of $Farms into Stargate protocol
            - Farm 50% tokens of $Farms into Curve protocol
            - Trade 10*(10% of $Swap) with personal Judgment to buy and hold Target Tokens
            - Leverage Trade 20*(5% of $Swap) in GMX|GAINS by quantitative trading model

- Fund Investor
    - This fund looks cool ! And it's risk is not very height (80% stable staking in farm protocol)
    - Stake my money here 
    - Check my reward|loss next time


## Trustless Fund Contracts:
- Core Contract
    - Main Router
        - Storage Actions
        - Storage Funds
    - Permission Limitation System
        - Token Control
            - Target Token | Target Pairs
            - Base Token
        - Fund Type
            - Farm
            - Swap
            - Leverage Trading
            - Mixed action
        - Action Share Public Time
            - Delay TimeStamp Publish

- Vault Contract
    - Action Management
        - Hold
        - Farm
        - Swap
        - Leverage Trading
        - Mixed action
    - Action Interfaces
        - Deposit
        - Withdraw

- User Contract
    - User System
        - Register
        - Permission Control
    - Invit System

- Explorer Contract
    - Funds
        - Funds History APY|VOL
        - Funds Action History
            - Delay TimeStamp Publish
    
## Support Pairs
- Stable
    - USDT | USDC | DAI | FRAX | BUSD

- Hold | Swap
    - WETH | WBTC | CURVE | STG | UNI | LINK | SOL 

- Leverage
    - ETH | BTC | UNI | CURVE | LINK | LTC | XMR | EUR 

- Farm
    - $stable

## Support Protocol

- Support Action Types
    - Hold
    - Swap
    - Leverage
    - Farm

- Support Protocol
    - Hold
        - Local vault
    - Swap
        - Uniswap | UniLike
        - Pancake
        - Curve
    - Leverage
        - GMX | GNS
    - Farm
        - Beefy
        - Stargate
        - Venus
        - Pancake