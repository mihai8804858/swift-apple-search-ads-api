import Foundation

public struct APIErrorResponse: Equatable, CustomDebugStringConvertible, Sendable {
    public let error: ErrorResponse?
    public let statusCode: Int

    public init(error: ErrorResponse?, statusCode: Int) {
        self.error = error
        self.statusCode = statusCode
    }

    public var debugDescription: String {
        """
        Error: \(errorResponseDescription)
        Status Code: \(statusCode)
        """
    }

    private var errorResponseDescription: String {
        guard let error else { return "Unknown" }
        return String.build {
            "("
            error
                .debugDescription
                .components(separatedBy: "\n")
                .map { "\t\($0)" }
                .joined(separator: "\n")
            ")"
        }
    }
}
