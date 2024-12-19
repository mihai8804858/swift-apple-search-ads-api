struct TargetingKeywordsListRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let task: RequestTask

    init(campaignId: Int, adGroupId: Int, pagination: Pagination? = nil) throws {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/targetingkeywords"
        task = .parameterized(EncodedParameters(
            encoding: URLEncoding.queryString,
            parameters: URLParameters([
                "limit": pagination?.limit,
                "offset": pagination?.offset
            ])
        ))
    }
}
