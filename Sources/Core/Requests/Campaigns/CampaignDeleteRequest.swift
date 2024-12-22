struct CampaignDeleteRequest: RequestType {
    let path: String
    let method = HTTPMethod.delete

    init(campaignId: Int) {
        path = "/api/v5/campaigns/\(campaignId)"
    }
}
