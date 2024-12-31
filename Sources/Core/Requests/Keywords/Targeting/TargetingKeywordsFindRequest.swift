struct TargetingKeywordsFindRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(campaignId: Int, selector: Selector<Keyword>?) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/targetingkeywords/find"
        body = .json(selector)
    }
}
