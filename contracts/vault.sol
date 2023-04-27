

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

    interface Farm{
        
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
    function deposit(address user,uint farm,uint256 amount) public onlyOwner returns (bool)
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