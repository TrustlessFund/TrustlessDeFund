/**
TODO : 
    - User system
        - Permission control system
        - Risk culcuation system
    - Fund system
        - Fund management
        - Fund open
        - Fund closed
    - Vault system
        - Fund action maker
 */


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
    interface Vault{
        function deposit(address player,uint farm,uint256 amount) external returns (bool);
        function withdraws(uint256 amount) external returns (uint256);
    }

contract TfCore is Ownable {
    using SafeMath for uint256;
    using Counters for Counters.Counter;
    using SafeERC20 for IERC20;

    /** Init constuctor */
    constructor() {
    }

}