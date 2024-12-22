struct AdsListRequest: RequestType {
    let path: String
    let method = HTTPMethod.get

    init(campaignId: Int, adGroupId: Int) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/ads"
    }
}
