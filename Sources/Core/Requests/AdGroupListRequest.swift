struct AdGroupListRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let task: RequestTask

    init(campaignId: Int, pagination: Pagination? = nil) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups"
        task = .parameterized(EncodedParameters(
            encoding: URLEncoding.queryString,
            parameters: URLParameters([
                "limit": pagination?.limit,
                "offset": pagination?.offset
            ])
        ))
    }
}
