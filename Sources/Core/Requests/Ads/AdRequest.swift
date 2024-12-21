struct AdRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let task = RequestTask.plain

    init(campaignId: Int, adGroupId: Int, adId: Int) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/ads/\(adId)"
    }
}
