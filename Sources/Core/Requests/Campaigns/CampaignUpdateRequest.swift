struct CampaignUpdateRequest: RequestType {
    let path: String
    let method = HTTPMethod.put
    let task: RequestTask

    init(campaignId: Int, campaign: CampaignUpdate) throws {
        path = "/api/v5/campaigns/\(campaignId)"
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: campaign)
        ))
    }
}
