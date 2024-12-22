struct CreativesListRequest: RequestType {
    let path = "/api/v5/creatives"
    let method = HTTPMethod.get
    let query: RequestQuery?

    init(pagination: Pagination?) {
        query = RequestQuery(pagination)
    }
}
