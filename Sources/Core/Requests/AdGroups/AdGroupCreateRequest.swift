struct AdGroupCreateRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(campaignId: Int, adGroup: AdGroup) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups"
        body = .json(adGroup)
    }
}
