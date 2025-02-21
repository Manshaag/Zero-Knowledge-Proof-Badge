contract ZKPNFT {
    struct NFT {
        uint256 tokenId;
        address owner;
    }
    
    NFT[] public nfts;
    mapping(address => bool) public verifiedUsers;
    uint256 private nextTokenId = 1;
    
    event NFTMinted(address owner, uint256 tokenId);
    
    function mintNFT() public {
        require(verifiedUsers[msg.sender], "User not verified");
        nfts.push(NFT(nextTokenId, msg.sender));
        emit NFTMinted(msg.sender, nextTokenId);
        nextTokenId++;
    }
    
    function verifyUser(address user) public {
        verifiedUsers[user] = true;
    }
    
    function getNFTCount() public view returns (uint256) {
        return nfts.length;
    }
}
