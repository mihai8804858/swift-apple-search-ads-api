struct TargetingKeywordsFindRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let task: RequestTask

    init(campaignId: Int, selector: Selector? = nil) throws {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/targetingkeywords/find"
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: selector)
        ))
    }
}
