struct AdsFindRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let task: RequestTask

    init(campaignId: Int?, selector: Selector?) throws {
        if let campaignId {
            path = "/api/v5/campaigns/\(campaignId)/ads/find"
        } else {
            path = "/api/v5/ads/find"
        }
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: selector)
        ))
    }
}
