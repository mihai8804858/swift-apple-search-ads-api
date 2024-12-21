struct AdCreateRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let task: RequestTask

    init(campaignId: Int, adGroupId: Int, ad: AdCreate) throws {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/ads"
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: ad)
        ))
    }
}
