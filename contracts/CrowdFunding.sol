// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CrowdFunding {
    struct Campaign{
        address owner;
        string title;
        string description;
        uint256 target;
        uint256 deadline;
        uint256 amountCollected;
        string image;
        address[] donators;
        uint256[] donations;
    }
    mapping(uint256 => Campaign) public campaigns;
    uint256 public nbOfCampaigns = 0;
    event Donation(uint256 indexed campaignId, address indexed donator, uint256 amount);

    function createCampaign(
        address _owner,
        string memory _title,
        string memory _description,
        uint256 _target,
        uint256 _deadline,
        string memory _image
    ) public returns (uint256){
        Campaign storage campaign = campaigns[nbOfCampaigns++];

        require(campaign.deadline < block.timestamp, "The deadline has not been reached");
        campaign.owner = _owner;
        campaign.title = _title;
        campaign.description = _description;
        campaign.target = _target;
        campaign.deadline = _deadline;
        campaign.amountCollected = 0;
        campaign.image = _image;

        return nbOfCampaigns - 1;

    }
    function donateToCampaign(uint256 _id) public payable {
        uint256 amount = msg.value;


        Campaign storage campaign = campaigns[_id];
        emit Donation(_id, msg.sender, amount);

        payable(campaign.owner).transfer(amount);
        campaign.amountCollected += amount;

    }

    function getDonators(uint256 _id) view public returns (address[] memory, uint256[] memory) {
        return (campaigns[_id].donators, campaigns[_id].donations);
    }
}
