struct AdGroupCreateRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let task: RequestTask

    init(campaignId: Int, adGroup: AdGroup) throws {
        path = "/api/v5/campaigns/\(campaignId)/adgroups"
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: adGroup)
        ))
    }
}
