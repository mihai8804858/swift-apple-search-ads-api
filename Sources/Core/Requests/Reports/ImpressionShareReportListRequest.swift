public struct ImpressionShareReportListParameters: Equatable, Encodable, Sendable {
    /// The name of a field.
    public let field: String?
    /// The order of grouped results.
    public let sortOrder: Sorting.Order?
    /// The number of items to return per request.
    ///
    /// For most objects, the default is 20 and the maximum is 1000.
    public let limit: Int?
    /// The offset pagination that limits the number of returned records.
    ///
    /// The start of each page is offset by the specified number.
    /// You can apply offset to most API calls, but not all GET endpoints support it.
    /// The default is 0.
    public let offset: Int?

    public init(sorting: Sorting? = nil, pagination: Pagination? = nil) {
        self.field = sorting?.field
        self.sortOrder = sorting?.sortOrder
        self.limit = pagination?.limit
        self.offset = pagination?.offset
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
