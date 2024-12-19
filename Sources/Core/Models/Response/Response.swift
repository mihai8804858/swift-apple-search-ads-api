import Foundation

/// A container for API response.
public struct Response<T: Sendable>: Sendable {
    /// Response model decoded from API response.
    public let model: T
    /// Response HTTP status code.
    public let statusCode: Int

    public init(model: T, statusCode: Int) {
        self.model = model
        self.statusCode = statusCode
    }

    func map<U>(_ transform: (T) -> U) -> Response<U> {
        Response<U>(model: transform(model), statusCode: statusCode)
    }
}

extension Response: Equatable where T: Equatable {}
