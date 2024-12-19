struct SearchAppsRequest: RequestType {
    let path = "/api/v5/search/apps"
    let method = HTTPMethod.get
    let task: RequestTask

    init(query: String? = nil, returnOwnedApps: Bool? = nil, pagination: Pagination? = nil) {
        task = .parameterized(EncodedParameters(
            encoding: URLEncoding.queryString,
            parameters: URLParameters([
                "query": query,
                "returnOwnedApps": returnOwnedApps,
                "limit": pagination?.limit,
                "offset": pagination?.offset
            ])
        ))
    }
}
