struct CampaignRequest: RequestType {
    let path: String
    let method = HTTPMethod.get

    init(campaignId: Int) {
        path = "/api/v5/campaigns/\(campaignId)"
    }
}
