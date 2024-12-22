public struct CreativeParameters: Equatable, Encodable, Sendable {
    /// Include deleted assets in the response.
    ///
    /// By default deleted assets don’t return.
    public let includeDeletedCreativeSetAssets: Bool?

    init(includeDeletedCreativeSetAssets: Bool? = nil) {
        self.includeDeletedCreativeSetAssets = includeDeletedCreativeSetAssets
    }
}

struct CreativeRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let query: RequestQuery?

    init(creativeId: Int, parameters: CreativeParameters) {
        path = "/api/v5/creatives/\(creativeId)"
        query = RequestQuery(parameters)
    }
}
