
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


    interface CoreContract{
    }

contract explorer is Ownable {
    using SafeMath for uint256;
    address private core ;
    constructor(address _core) 
    {
        core=_core;
    }

    function getCore() public returns(address) 
    {
        return core;
    }

    function setCore(address _core) public onlyOwner 
    {
        core=_core;
    }

}