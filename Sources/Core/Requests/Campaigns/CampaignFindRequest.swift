struct CampaignFindRequest: RequestType {
    let path = "/api/v5/campaigns/find"
    let method = HTTPMethod.post
    let task: RequestTask

    init(selector: Selector? = nil) throws {
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: selector)
        ))
    }
}
