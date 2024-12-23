import Foundation

extension Error {
    var statusCode: ResponseStatus {
        APIError(error: self).statusCode
    }

    var isUnauthorized: Bool {
        APIError(error: self).isUnauthorized
    }

    var isForbidden: Bool {
        APIError(error: self).isForbidden
    }

    var isNotConnectedToInternet: Bool {
        if let error = self as? URLError {
            error.isNotConnectedToInternet
        } else {
            (self as NSError).isNotConnectedToInternet
        }
    }

    var isConnectionLost: Bool {
        if let error = self as? URLError {
            error.isConnectionLost
        } else {
            (self as NSError).isConnectionLost
        }
    }

    var isRetryableWithBackoff: Bool {
        let isTooManyRequests = statusCode == ResponseStatus.tooManyRequests
        let isServerError = ResponseStatus.serverErrorRange.contains(statusCode)

        return isTooManyRequests || isServerError
    }

    var isRetryable: Bool {
        isConnectionLost
    }
}

extension URLError {
    var isNotConnectedToInternet: Bool {
        code == .notConnectedToInternet
    }

    var isConnectionLost: Bool {
        code == .networkConnectionLost
    }
}

extension NSError {
    var isNotConnectedToInternet: Bool {
        domain == NSURLErrorDomain && code == NSURLErrorNotConnectedToInternet
    }

    var isConnectionLost: Bool {
        domain == NSURLErrorDomain && code == NSURLErrorNetworkConnectionLost
    }
}
