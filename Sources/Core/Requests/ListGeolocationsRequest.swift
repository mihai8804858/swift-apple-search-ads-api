struct ListGeolocationsRequest: RequestType {
    let path = "/api/v5/search/geo"
    let method = HTTPMethod.post
    let task: RequestTask

    init(requests: [GeolocationRequest], pagination: Pagination? = nil) throws {
        task = .composite(
            body: EncodedParameters(
                encoding: JSONEncoding.default,
                parameters: try URLParameters(encoding: requests)
            ),
            url: URLParameters([
                "limit": pagination?.limit,
                "offset": pagination?.offset
            ])
        )
    }
}
