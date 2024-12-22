struct CampaignNegativeKeywordsCreateRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(campaignId: Int, keywords: [NegativeKeyword]) {
        path = "/api/v5/campaigns/\(campaignId)/negativekeywords/bulk"
        body = .json(keywords)
    }
}
