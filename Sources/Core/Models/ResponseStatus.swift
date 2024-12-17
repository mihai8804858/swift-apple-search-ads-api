public enum ResponseStatus: Int, Sendable {
    case success = 200
    case redirection = 300
    case clientError = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case tooManyRequests = 429
    case serverError = 500
    case networkConnectTimeoutError = 599

    public static var successRange: Range<Int> {
        return ResponseStatus.success.rawValue..<ResponseStatus.redirection.rawValue
    }

    public static var serverErrorRange: ClosedRange<Int> {
        return ResponseStatus.serverError.rawValue...ResponseStatus.networkConnectTimeoutError.rawValue
    }

    public var code: Int {
        return rawValue
    }
}
