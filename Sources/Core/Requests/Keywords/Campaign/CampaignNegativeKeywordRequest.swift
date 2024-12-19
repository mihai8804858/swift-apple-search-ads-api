struct CampaignNegativeKeywordRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let task = RequestTask.plain

    init(campaignId: Int, keywordId: Int) throws {
        path = "/api/v5/campaigns/\(campaignId)/negativekeywords/\(keywordId)"
    }
}
