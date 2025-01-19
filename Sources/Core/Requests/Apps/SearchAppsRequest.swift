public struct SearchAppsRequestParameters: Hashable, Encodable, Sendable {
    /// The query for a list of iOS apps using a matching prefix.
    public let query: String?
    /// The list of apps belonging to your organization.
    public let returnOwnedApps: Bool?
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

    public init(query: String? = nil, returnOwnedApps: Bool? = nil, pagination: Pagination? = nil) {
        self.query = query
        self.returnOwnedApps = returnOwnedApps
        self.limit = pagination?.limit
        self.offset = pagination?.offset
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
