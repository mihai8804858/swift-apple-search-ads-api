struct CampaignUpdateRequest: RequestType {
    let path: String
    let method = HTTPMethod.put
    let body: RequestBody?

    init(campaignId: Int, campaign: CampaignUpdate) {
        path = "/api/v5/campaigns/\(campaignId)"
        body = .json(campaign)
    }
}
