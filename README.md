# auction_truffle
starter proj on truffle (solidity based on) &amp; figuring out this stuff
# Usage
- npm install -g truffle
- truffle develop
- truffle migrate

# Working
# "0x345ca3e014aaf5dca488057592ee47305d9b3e10" - from output of migrate command
- Auction.at("0x345ca3e014aaf5dca488057592ee47305d9b3e10").manager.call(); // set manager
- Auction.at("0x345ca3e014aaf5dca488057592ee47305d9b3e10").auction(3, {from: "0x2932b7a2355d6fecc4b5c0b6bd44cc31df247a2e" }); // set auction from account
- Auction.at("0x345ca3e014aaf5dca488057592ee47305d9b3e10").seller.call(); // check the seller (should be as prev. value)
- Auction.at("0x345ca3e014aaf5dca488057592ee47305d9b3e10").latestBid.call(); // latestBid
- Auction.at("0x345ca3e014aaf5dca488057592ee47305d9b3e10").latestBidder.call(); // latestBidder