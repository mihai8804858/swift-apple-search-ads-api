struct CampaignNegativeKeywordsDeleteRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(campaignId: Int, keywordIds: [Int]) {
        path = "/api/v5/campaigns/\(campaignId)/negativekeywords/delete/bulk"
        body = .json(keywordIds)
    }
}
