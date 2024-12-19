/// The number of items that return in the page.
public struct PageDetail: Codable, Equatable, Sendable {
    /// The total number of entries that return for the operation.
    public let totalResults: Int
    /// The offset of the first entry that returns. Use offset in the request query string or Selector to override
    /// the default value of 0. For example, if the request is offset=5, the response startIndex is also 5.
    /// A value of 0 retrieves the first itemsPerPage results from the full result set.
    public let startIndex: Int
    /// The maximum number of entries that return for this operation, which is the value of count in the GET operation.
    /// The actual number of entries that return can be less than the maximum itemsPerPage.
    public let itemsPerPage: Int

    public init(totalResults: Int, startIndex: Int, itemsPerPage: Int) {
        self.totalResults = totalResults
        self.startIndex = startIndex
        self.itemsPerPage = itemsPerPage
    }
}
