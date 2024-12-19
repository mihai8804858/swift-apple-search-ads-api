struct AdGroupUpdateRequest: RequestType {
    let path: String
    let method = HTTPMethod.put
    let task: RequestTask

    init(campaignId: Int, adGroupId: Int, adGroup: AdGroupUpdate) throws {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)"
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: adGroup)
        ))
    }
}
