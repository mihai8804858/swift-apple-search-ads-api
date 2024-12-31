public extension APIProvider {
    /// Fetch all pages from a paginated API endpoint until no items are returned.
    ///
    /// - Parameters:
    ///     - size: Page size. Defaults to 20.
    ///     - request: The operation that performs the request given the current page info.
    ///
    /// - Returns: An async sequence of type `PagedResponse`.
    ///
    /// - Throws: An error of type `APIError`.
    func pages<T: Sendable>(
        size: Int = 20,
        request: @escaping @Sendable (APIProvider, Pagination) async throws -> Response<Paginated<T>>
    ) -> PagedResponse<T> {
        PagedResponse(size: size) { pagination in
            try await request(self, pagination)
        }
    }
}
