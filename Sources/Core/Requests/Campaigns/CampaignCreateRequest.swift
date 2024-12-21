struct CampaignCreateRequest: RequestType {
    let path = "/api/v5/campaigns"
    let method = HTTPMethod.post
    let task: RequestTask

    init(campaign: Campaign) throws {
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: campaign)
        ))
    }
}
