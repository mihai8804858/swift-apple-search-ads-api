struct AdsFindRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(campaignId: Int?, selector: Selector?) {
        body = .json(selector)
        if let campaignId {
            path = "/api/v5/campaigns/\(campaignId)/ads/find"
        } else {
            path = "/api/v5/ads/find"
        }
    }
}
