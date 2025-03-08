public struct AppLocaleDetailsParameters: Hashable, Encodable, Sendable {
    /// Detailed app asset details of a device. Use `true` for expanded values in the API response.
    public let expand: Bool

    public init(expand: Bool) {
        self.expand = expand
    }
}

struct AppLocaleDetailsRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let query: RequestQuery?

    init(adamId: Int, parameters: AppLocaleDetailsParameters?) {
        path = "/api/v5/apps/\(adamId)/locale-details"
        query = RequestQuery(parameters)
    }
}
