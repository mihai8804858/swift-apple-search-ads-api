public struct PageDetail: Equatable, Decodable, Sendable {
    public let totalResults: Int
    public let startIndex: Int
    public let itemsPerPage: Int

    public init(totalResults: Int, startIndex: Int, itemsPerPage: Int) {
        self.totalResults = totalResults
        self.startIndex = startIndex
        self.itemsPerPage = itemsPerPage
    }
}
