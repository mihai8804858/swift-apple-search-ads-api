public struct SearchAppsRequestParameters: Equatable, Encodable, Sendable {
    /// The query for a list of iOS apps using a matching prefix.
    public let query: String?
    /// The list of apps belonging to your organization.
    public let returnOwnedApps: Bool?
    /// The offset and limit pagination that limits the number of records returned.
    public let pagination: Pagination?

    public init(query: String? = nil, returnOwnedApps: Bool? = nil, pagination: Pagination? = nil) {
        self.query = query
        self.returnOwnedApps = returnOwnedApps
        self.pagination = pagination
    }
}

struct SearchAppsRequest: RequestType {
    let path = "/api/v5/search/apps"
    let method = HTTPMethod.get
    let query: RequestQuery?

    init(parameters: SearchAppsRequestParameters) {
        query = RequestQuery(parameters)
    }
}
