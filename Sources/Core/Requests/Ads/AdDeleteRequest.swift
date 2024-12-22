struct AdDeleteRequest: RequestType {
    let path: String
    let method = HTTPMethod.delete

    init(campaignId: Int, adGroupId: Int, adId: Int) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/ads/\(adId)"
    }
}
