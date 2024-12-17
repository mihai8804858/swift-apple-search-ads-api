import Foundation

public enum APIError: Swift.Error, Equatable, CustomDebugStringConvertible, Sendable {
    case noInternetConnection
    case api(APIErrorResponse)
    case other(Error)

    public init(error: Error) {
        if let apiError = error as? APIError {
            self = apiError
        } else if error.isNotConnectedToInternet {
            self = .noInternetConnection
        } else {
            self = .other(error)
        }
    }

    public init(response: APIResponse<Data>) {
        self = .api(APIErrorResponse(
            error: try? JSONDecoder.default.decode(ErrorResponse.self, from: response.model),
            statusCode: response.statusCode
        ))
    }

    public var statusCode: Int {
        switch self {
        case .noInternetConnection: URLError.Code.notConnectedToInternet.rawValue
        case .api(let response): response.statusCode
        case .other(let error as NSError): error.code
        }
    }

    public var isNotConnectedToInternet: Bool {
        guard case .noInternetConnection = self else { return false }
        return true
    }

    public var isForbidden: Bool {
        statusCode == ResponseStatus.forbidden.code
    }

    public var isUnauthorized: Bool {
        statusCode == ResponseStatus.unauthorized.code
    }

    public var errorResponse: APIErrorResponse? {
        switch self {
        case .api(let response): response
        default: nil
        }
    }

    public static func == (lhs: APIError, rhs: APIError) -> Bool {
        switch (lhs, rhs) {
        case (.noInternetConnection, .noInternetConnection): true
        case let (.api(lhsError), .api(rhsError)): lhsError == rhsError
        case let (.other(lhsError), .other(rhsError)): lhsError.localizedDescription == rhsError.localizedDescription
        default: false
        }
    }

    public var debugDescription: String {
        switch self {
        case .noInternetConnection: "Missing internet connectivity"
        case .api(let response): response.debugDescription
        case .other(let error): "\(error)"
        }
    }
}
