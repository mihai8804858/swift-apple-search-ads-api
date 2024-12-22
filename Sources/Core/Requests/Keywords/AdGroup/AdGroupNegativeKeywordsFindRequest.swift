struct AdGroupNegativeKeywordsFindRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(campaignId: Int, selector: Selector?) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/negativekeywords/find"
        body = .json(selector)
    }
}
