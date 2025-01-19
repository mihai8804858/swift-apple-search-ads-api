import Foundation

/// A container for errors throws by this library.
public enum APIError: Swift.Error, Hashable, Sendable {
    /// API request failed with "not connected to internet" status code.
    case noInternetConnection
    /// API responded with an error response.
    case api(APIErrorResponse)
    /// Other error encountered. Can be JWT encoding, response decoding, and others.
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

    public init(response: Response<Data>) {
        self = .api(APIErrorResponse(
            error: try? JSONDecoder.default.decode(ErrorResponse.self, from: response.model),
            statusCode: response.statusCode
        ))
    }

    /// Error response status code.
    public var statusCode: ResponseStatus {
        switch self {
        case .noInternetConnection: ResponseStatus(rawValue: URLError.Code.notConnectedToInternet.rawValue)
        case .api(let response): response.statusCode
        case .other(let error as URLError): ResponseStatus(rawValue: error.code.rawValue)
        case .other(let error as NSError): ResponseStatus(rawValue: error.code)
        }
    }

    /// Verify if API request failed with "not connected to internet" status code.
    public var isNotConnectedToInternet: Bool {
        guard case .noInternetConnection = self else { return false }
        return true
    }

    /// Verify if API request failed with "forbidden" (403) status code.
    public var isForbidden: Bool {
        statusCode == ResponseStatus.forbidden
    }

    /// Verify if API request failed with "unauthorized" (401) status code.
    public var isUnauthorized: Bool {
        statusCode == ResponseStatus.unauthorized
    }

    /// Verify if API request failed with "tooManyRequests" (429) status code.
    public var isTooManyRequests: Bool {
        statusCode == ResponseStatus.tooManyRequests
    }

    /// Error response that was returned by the API.
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

    public func hash(into hasher: inout Hasher) {
        switch self {
        case .noInternetConnection: hasher.combine(1)
        case .api(let response): hasher.combine(response)
        case .other(let error): error.localizedDescription.hash(into: &hasher)
        }
    }
}
