struct CampaignNegativeKeywordsUpdateRequest: RequestType {
    let path: String
    let method = HTTPMethod.put
    let task: RequestTask

    init(campaignId: Int, keywords: [NegativeKeyword]) throws {
        path = "/api/v5/campaigns/\(campaignId)/negativekeywords/bulk"
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: keywords)
        ))
    }
}
