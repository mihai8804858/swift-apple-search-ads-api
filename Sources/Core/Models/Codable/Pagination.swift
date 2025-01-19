/// The procedure to refine returned results using limit and offset parameters.
public struct Pagination: Codable, Hashable, Sendable {
    /// The number of items to return per request.
    ///
    /// For most objects, the default is 20 and the maximum is 1000.
    public let limit: Int
    /// The offset pagination that limits the number of returned records.
    ///
    /// The start of each page is offset by the specified number.
    /// You can apply offset to most API calls, but not all GET endpoints support it.
    /// The default is 0.
    public let offset: Int

    public init(limit: Int, offset: Int) {
        self.limit = limit
        self.offset = offset
    }
}
