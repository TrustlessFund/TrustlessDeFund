
/** 
 * This contract is to test the sub-contract deploy by contracts
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

contract subContractDeployTest is Ownable{
  address[] public contracts;
  function getContractCount() 
    public
    view
    returns(address[] memory a)
  {
    return contracts;
  }

  function newContract()
    public
    returns(address newContracts)
  {
    address s = address(new subContract());
    contracts.push(s);
    return s;
  }
}

contract subContract {
    string lol;
    function set(string memory sth) public  {
        lol=sth;
    }

    function get()
    public
    view
    returns (string memory sth)
  {
    return lol;
  }    
}