struct AdUpdateRequest: RequestType {
    let path: String
    let method = HTTPMethod.put
    let body: RequestBody?

    init(campaignId: Int, adGroupId: Int, adId: Int, ad: AdUpdate) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/ads/\(adId)"
        body = .json(ad)
    }
}
