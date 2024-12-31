struct CampaignNegativeKeywordsFindRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(campaignId: Int, selector: Selector<NegativeKeyword>?) {
        path = "/api/v5/campaigns/\(campaignId)/negativekeywords/find"
        body = .json(selector)
    }
}
