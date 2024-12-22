public struct ImpressionShareReportListParameters: Equatable, Encodable, Sendable {
    /// The order of grouped results.
    public let sorting: Sorting?
    /// The offset and limit pagination that limits the number of records returned.
    public let pagination: Pagination?

    public init(sorting: Sorting? = nil, pagination: Pagination? = nil) {
        self.sorting = sorting
        self.pagination = pagination
    }
}

struct ImpressionShareReportListRequest: RequestType {
    let path = "/api/v5/custom-reports"
    let method = HTTPMethod.get
    let query: RequestQuery?

    init(parameters: ImpressionShareReportListParameters) {
        query = RequestQuery(parameters)
    }
}
