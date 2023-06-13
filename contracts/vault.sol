

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
    interface ERC20Token{
        function balanceOf(address account) external view returns (uint256);
        function approve(address spender, uint256 amount) external returns (bool);
        function transfer(address to, uint256 amount) external returns (bool);
    }
/**
Farm type interface
 */

    interface StargateFi{

        //0x45a01e4e04f14f7a4a6702c74187c5f6222033cd :: Stargate Router
        function addLiquidity(
            uint256 _poolId, //USDT : 2 
            uint256 _amountLD, //1000000
            address _to //address(this)
        ) external;
        function instantRedeemLocal(
            uint16 _srcPoolId,//USDT : 2
            uint256 _amountLP,//balanceOf(address(this))
            address _to //address(this)
        ) external;


        //0x8731d54e9d02c286767d56ac03e8037c07e01e98
        function deposit(
            uint256 _pid, //USDT : 2 
            uint256 _amount //1000000
            ) external;
        function withdraw(
            uint256 _pid, 
            uint256 _amount
            ) external;
    }

    interface BeefyFarm{
        /**
         * 0x1c480521100c962f7da106839a5a504b5a7457a1 :: Stargate USDT
         * 
         */
        function deposit(uint _amount) external;
        function depositAll() external;
        function withdrawAll() external;
        function withdraw(uint256 _shares) external;
    }

/**
Swap type interface
 */
    interface IUniswapV2Router {
        function getAmountsOut(uint256 amountIn, address[] memory path) external view returns (uint256[] memory amounts);
        function swapExactTokensForTokens(uint256 amountIn, uint256 amountOutMin, address[] calldata path, address to, uint256 deadline) external returns (uint256[] memory amounts);
    }

    // interface Icurve {
    //     function get_dy_underlying (uint128 i,uint128 j,uint256 dx) external view returns (uint256);
    //     function exchange (uint128 i,uint128 j,uint256 dx,uint256 mini_dy) external ;
    //     function exchange_underlying (uint128 i,uint128 j,uint256 dx,uint256 mini_dy) external ;
    // }

    //Stable Coin Swap
    interface Isynapase {
        function swap(
            uint8 tokenIndexFrom,
            uint8 tokenIndexTo,
            uint256 dx,
            uint256 minDy,
            uint256 deadline
        ) external returns (uint256);
    }

/**
Leverage type interface
 */
    interface GMX{

    }

    interface GNS{

    }

/** 
 * Lending protocol interface
 * suit for circle staking
 */


/** 
 * Flashloan protocol interface
 * suit for AMM
 */

struct rules {
    address owner ; 
    uint ruleType ; // 0 : staking only ; 1 : staking + trading ; 2 : staking + trading + leverage 
    uint[3] rulePercentage ; //0+1+2 == 10000 ; 0 : staking percentage ; 1 : trading percentage ; 2 : leverage trading percentage ;
    address keyToken ;
    address[3][] allowTokens ;//0 : staking token ; 1 : trading token ; 2 : leverage trading token ;
}

struct actionRecord {
    uint action ; //0 : staking ; 1 : trading ; 2 : leverage trading ;
    uint256 amount ; 
    uint256 timestamp ;
}
contract vault is Ownable{
/** Vault settings */

    mapping (string => address) farmTarget;
    address keyToken ;

    constructor(address key)
    {
        keyToken=key;
    }

    function setting(address target , string memory name)public onlyOwner returns (bool)
    {
        farmTarget[name] = target;
        return true;
    }

/** Deposit system */
/**
    Action Type : 
    - 0 : swap
    - 1 : leverage
    - 2 : farm
 */

    function deposit(address user,uint farm,uint256 amount , uint actionType ) public onlyOwner returns (bool)
    {
        IERC20(keyToken).transferFrom(user,address(this), amount);
        //TODO deposit token into farming protocol
        return true;
    }

/** Withdraws system */

    function withdrawsEth(uint256 totallWithdraws) public onlyOwner returns (uint256){
        payable(msg.sender).transfer(totallWithdraws);
        return totallWithdraws;
    }

    function withdraws(uint256 amount) public onlyOwner returns (uint256){
        //TODO withdraws token from farming
        IERC20(keyToken).transfer(msg.sender, amount);
        return amount;
    }
}