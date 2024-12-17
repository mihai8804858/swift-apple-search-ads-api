import Foundation

/// A container for error API response.
public struct APIErrorResponse: Equatable, Sendable {
    /// Error response model decoded from API response.
    public let error: ErrorResponse?
    /// Response HTTP status code.
    public let statusCode: Int

    /// Create an instance of `APIErrorResponse`.
    ///
    /// - Parameters:
    ///     - error: Error response model decoded from API response.
    ///     - statusCode: Response HTTP status code.
    public init(error: ErrorResponse?, statusCode: Int) {
        self.error = error
        self.statusCode = statusCode
    }
}
