struct CampaignListRequest: RequestType {
    let path = "/api/v5/campaigns"
    let method = HTTPMethod.get
    let task: RequestTask

    init(pagination: Pagination? = nil) {
        task = .parameterized(EncodedParameters(
            encoding: URLEncoding.queryString,
            parameters: URLParameters([
                "limit": pagination?.limit,
                "offset": pagination?.offset
            ])
        ))
    }
}
