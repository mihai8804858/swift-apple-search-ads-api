struct AdGroupFindRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let task: RequestTask

    init(campaignId: Int? = nil, selector: Selector? = nil) throws {
        if let campaignId {
            path = "/api/v5/campaigns/\(campaignId)/adgroups/find"
        } else {
            path = "/api/v5/adgroups/find"
        }
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: selector)
        ))
    }
}
