struct CampaignRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let task = RequestTask.plain

    init(campaignId: Int) {
        path = "/api/v5/campaigns/\(campaignId)"
    }
}
