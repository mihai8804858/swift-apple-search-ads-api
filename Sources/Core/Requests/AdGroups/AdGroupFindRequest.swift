struct AdGroupFindRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(campaignId: Int?, selector: Selector<AdGroup>?) {
        body = .json(selector)
        if let campaignId {
            path = "/api/v5/campaigns/\(campaignId)/adgroups/find"
        } else {
            path = "/api/v5/adgroups/find"
        }
    }
}
