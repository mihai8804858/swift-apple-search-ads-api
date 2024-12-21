struct CreativesListRequest: RequestType {
    let path = "/api/v5/creatives"
    let method = HTTPMethod.get
    let task: RequestTask

    init(pagination: Pagination?) {
        task = .parameterized(EncodedParameters(
            encoding: URLEncoding.queryString,
            parameters: URLParameters([
                "limit": pagination?.limit,
                "offset": pagination?.offset
            ])
        ))
    }
}
