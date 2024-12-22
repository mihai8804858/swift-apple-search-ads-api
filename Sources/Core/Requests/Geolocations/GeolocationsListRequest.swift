struct GeolocationsListRequest: RequestType {
    let path = "/api/v5/search/geo"
    let method = HTTPMethod.post
    let query: RequestQuery?
    let body: RequestBody?

    init(requests: [GeolocationRequest], pagination: Pagination?) {
        query = RequestQuery(pagination)
        body = .json(requests)
    }
}
