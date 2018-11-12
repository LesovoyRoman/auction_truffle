pragma solidity 0.4.25;
pragma experimental "v0.5.0";
pragma experimental ABIEncoderV2;

contract Freelancer {
    address public owner;
    uint256 private coins;
    uint256 private cash;
    string private service;
    
    constructor() public {
        owner = msg.sender;
        coins = 0;
        cash = 0;
        service = "";
    }
    
    event logFreelancerChanged(
        address indexed owner,
        string first_name,
        string last_name,
        uint256 coins,
        uint256 cash,
        string service
    );
    
    event logAssetsChanged(
        address indexed owner,
        uint256 coins, 
        uint256 cash,
        string service
    );
    
    struct FreelancerData {
        string first_name;
        string last_name;
        uint256 coins;
        uint256 cash;
        string service;
    }
    
    mapping (address => FreelancerData) FreelancersData;
    
    modifier onlyFreelancer() {
        require(owner == msg.sender, "Sender not authorized.");
        _;
    }
    
    /**
     * @dev Sets all data for freelancer
     * @param _firstname The first name of the freelancer
     * @param _lastname The last name of the freelancer
     * @param _coins Amount of coins available
     * @param _cash Amount of cash available
     * @param _service Service offered by the freelancer
     * @return FreelancerData struct of the owner
     */
    function setFreelancer(
    string _firstname,
    string _lastname,
    uint256 _coins,
    uint256 _cash,
    string _service) public onlyFreelancer returns (FreelancerData) {
        FreelancersData[owner].first_name = _firstname;
        FreelancersData[owner].last_name = _lastname;
        FreelancersData[owner].coins = _coins;
        FreelancersData[owner].cash = _cash;
        FreelancersData[owner].service = _service;
        emit logFreelancerChanged(owner, _firstname, _lastname, _coins, _cash, _service);
        return FreelancersData[owner];
    }
    
   /**
     * @dev Sets all assets for freelancer
     * @param _coins Amount of coins available
     * @param _cash Amount of cash available
     * @param _service Service offered by the freelancer
     * @return FreelancerData struct of the owner
     */
    function setAssets(
        uint256 _coins, 
        uint256 _cash,
        string _service) public onlyFreelancer returns (FreelancerData) {
        FreelancersData[owner].coins = _coins;
        FreelancersData[owner].cash = _cash;
        FreelancersData[owner].service = _service;
        emit logAssetsChanged(owner, _coins, _cash, _service);
        return FreelancersData[owner];
    }
    
    function myAccount() public onlyFreelancer view returns (FreelancerData) {
        FreelancerData memory fdata = FreelancersData[owner];
        return fdata;
    }
}