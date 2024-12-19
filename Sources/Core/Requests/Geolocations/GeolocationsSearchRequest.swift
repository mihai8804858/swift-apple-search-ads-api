struct GeolocationsSearchRequest: RequestType {
    let path = "/api/v5/search/geo"
    let method = HTTPMethod.get
    let task: RequestTask

    init(
        query: String? = nil,
        countryCode: String? = nil,
        entity: GeolocationEntity? = nil,
        pagination: Pagination? = nil
    ) {
        task = .parameterized(EncodedParameters(
            encoding: URLEncoding.queryString,
            parameters: URLParameters([
                "query": query,
                "countrycode": countryCode,
                "entity": entity?.rawValue,
                "limit": pagination?.limit,
                "offset": pagination?.offset
            ])
        ))
    }
}
