struct AdGroupUpdateRequest: RequestType {
    let path: String
    let method = HTTPMethod.put
    let body: RequestBody?

    init(campaignId: Int, adGroupId: Int, adGroup: AdGroupUpdate) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)"
        body = .json(adGroup)
    }
}
