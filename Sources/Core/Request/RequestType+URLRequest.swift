import Foundation
import URLQueryEncoder

enum RequestEncodingError: Swift.Error, Sendable {
    case invalidURL
}

extension RequestType {
    func urlRequest(baseURL: URL) throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            throw RequestEncodingError.invalidURL
        }
        components.queryItems = query?.encode()
        guard let requestURL = components.url else {
            throw RequestEncodingError.invalidURL
        }
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        if let body, let bodyData = try body.encode(body.value) {
            request.setValue(body.contentType, forHTTPHeaderField: "Content-Type")
            request.httpBody = bodyData
        }

        return request
    }
}
