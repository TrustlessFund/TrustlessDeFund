

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
    interface BeefyFarm{
        
    }

/**
Swap type interface
 */
    interface IUniswapV2Router {
    function getAmountsOut(uint256 amountIn, address[] memory path) external view returns (uint256[] memory amounts);
    function swapExactTokensForTokens(uint256 amountIn, uint256 amountOutMin, address[] calldata path, address to, uint256 deadline) external returns (uint256[] memory amounts);
    }

    interface Icurve {
        function get_dy_underlying (uint128 i,uint128 j,uint256 dx) external view returns (uint256);
        function exchange (uint128 i,uint128 j,uint256 dx,uint256 mini_dy) external ;
        function exchange_underlying (uint128 i,uint128 j,uint256 dx,uint256 mini_dy) external ;
    }

/**
Leverage type interface
 */
    interface GMX{

    }

    interface GNS{

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

    function deposit(address user,uint farm,uint256 amount , unit actionType ) public onlyOwner returns (bool)
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