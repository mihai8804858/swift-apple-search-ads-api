import Foundation

/// A container for error API response.
public struct APIErrorResponse: Hashable, Sendable {
    /// Error response model decoded from API response.
    public let error: ErrorResponse?
    /// Response HTTP status code.
    public let statusCode: ResponseStatus

    public init(error: ErrorResponse?, statusCode: ResponseStatus) {
        self.error = error
        self.statusCode = statusCode
    }
}
