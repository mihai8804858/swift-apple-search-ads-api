struct AdUpdateRequest: RequestType {
    let path: String
    let method = HTTPMethod.put
    let task: RequestTask

    init(campaignId: Int, adGroupId: Int, adId: Int, ad: AdUpdate) throws {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/ads/\(adId)"
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: ad)
        ))
    }
}
