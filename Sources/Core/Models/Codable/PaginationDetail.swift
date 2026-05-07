public struct PaginationDetail: Page, Hashable {
    public let totalCount: Int
    public let offset: Int
    public let pageSize: Int

    public var totalResults: Int { totalCount }
    public var startIndex: Int { offset }
    public var itemsPerPage: Int { pageSize }

    public init(totalCount: Int, offset: Int, pageSize: Int) {
        self.totalCount = totalCount
        self.offset = offset
        self.pageSize = pageSize
    }
}
