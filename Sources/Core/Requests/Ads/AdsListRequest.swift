struct AdsListRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let task = RequestTask.plain

    init(campaignId: Int, adGroupId: Int) throws {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/ads"
    }
}
