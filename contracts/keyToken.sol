pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
contract keyToken is ERC20 {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    constructor(string memory tokenName , string memory tokenTag) ERC20 (tokenName, tokenTag) {
        uint256 num=1000000;
        _mint(msg.sender,num.mul(1e18));
    }

     function faucet() public  {
        uint256 num=1000000;
        _mint(msg.sender,num.mul(1e18));
     }

}