/// HTTP response status code.
public struct ResponseStatus: RawRepresentable, Hashable, Comparable, Sendable, ExpressibleByIntegerLiteral {
    /// The HTTP response status.
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public init(integerLiteral value: Int) {
        self.rawValue = value
    }

    public static func < (lhs: ResponseStatus, rhs: ResponseStatus) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    /// The success status range: 200...299.
    public static var successRange: Range<ResponseStatus> {
        ResponseStatus.success..<ResponseStatus.redirection
    }

    /// The server error status range: 500...599.
    public static var serverErrorRange: ClosedRange<ResponseStatus> {
        ResponseStatus.serverError...ResponseStatus.networkConnectTimeoutError
    }

    public static let success = ResponseStatus(rawValue: 200)
    public static let redirection = ResponseStatus(rawValue: 300)
    public static let badRequest = ResponseStatus(rawValue: 400)
    public static let unauthorized = ResponseStatus(rawValue: 401)
    public static let forbidden = ResponseStatus(rawValue: 403)
    public static let tooManyRequests = ResponseStatus(rawValue: 429)
    public static let serverError = ResponseStatus(rawValue: 500)
    public static let networkConnectTimeoutError = ResponseStatus(rawValue: 599)
}
