struct CampaignNegativeKeywordsDeleteRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let task: RequestTask

    init(campaignId: Int, keywordIds: [Int]) throws {
        path = "/api/v5/campaigns/\(campaignId)/negativekeywords/delete/bulk"
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: keywordIds)
        ))
    }
}
