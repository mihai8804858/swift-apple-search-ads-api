struct AdGroupNegativeKeywordsCreateRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let task: RequestTask

    init(campaignId: Int, adGroupId: Int, keywords: [NegativeKeyword]) throws {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/negativekeywords/bulk"
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: keywords)
        ))
    }
}