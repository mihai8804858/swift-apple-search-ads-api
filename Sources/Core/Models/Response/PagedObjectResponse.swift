import Foundation

/// An `AsyncSequence` of responses to requests from an API endpoint
///
/// If the endpoint generates more than a single page of responses the sequence will emit each response page in turn
/// until all have been received.
public struct PagedObjectResponse<T: Sendable>: AsyncSequence, AsyncIteratorProtocol, Sendable {
    public typealias Request = @Sendable (Pagination) async throws -> Response<PaginatedObject<T>>
    public typealias Element = Response<PaginatedObject<T>>

    private var currentPageDetail: PageDetail?

    let size: Int
    let request: Request

    public init(size: Int, request: @escaping Request) {
        self.size = size
        self.request = request
    }

    public func makeAsyncIterator() -> Self { self }

    public mutating func next() async throws -> Response<PaginatedObject<T>>? {
        guard !Task.isCancelled else { return nil }
        if let current = currentPageDetail {
            guard current.startIndex + size < current.totalResults else { return nil }
            let pagination = Pagination(limit: size, offset: current.startIndex + size)
            let response = try await request(pagination)
            currentPageDetail = response.model.pagination
            return response
        } else {
            let pagination = Pagination(limit: size, offset: 0)
            let response = try await request(pagination)
            currentPageDetail = response.model.pagination
            return response
        }
    }
}
