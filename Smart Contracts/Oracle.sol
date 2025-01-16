// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Oracle {
    mapping(address => AggregatorV3Interface) public priceFeeds;

    function setPriceFeed(address _token, address _priceFeed) public {
        priceFeeds[_token] = AggregatorV3Interface(_priceFeed);
    }

    function getPrice(address _token) public view returns (uint256) {
        AggregatorV3Interface feed = priceFeeds[_token];
        require(address(feed) != address(0), "No price feed for this token");
        (, int price, , , ) = feed.latestRoundData();
        require(price > 0, "Invalid price");
        return uint256(price) * 10**10; // Adjusting for Chainlink's 8 decimal precision to 18
    }
}
