struct AdCreateRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(campaignId: Int, adGroupId: Int, ad: AdCreate) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/ads"
        body = .json(ad)
    }
}
