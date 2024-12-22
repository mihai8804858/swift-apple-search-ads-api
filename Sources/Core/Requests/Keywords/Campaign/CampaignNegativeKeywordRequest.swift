struct CampaignNegativeKeywordRequest: RequestType {
    let path: String
    let method = HTTPMethod.get

    init(campaignId: Int, keywordId: Int) {
        path = "/api/v5/campaigns/\(campaignId)/negativekeywords/\(keywordId)"
    }
}
