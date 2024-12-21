struct CampaignDeleteRequest: RequestType {
    let path: String
    let method = HTTPMethod.delete
    let task = RequestTask.plain

    init(campaignId: Int) {
        path = "/api/v5/campaigns/\(campaignId)"
    }
}
