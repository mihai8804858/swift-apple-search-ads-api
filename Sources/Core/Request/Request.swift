import Foundation

enum RequestTask: Sendable {
    case plain
    case parameterized(EncodedParameters)
    case composite(body: EncodedParameters, url: URLParameters)
}

protocol RequestType: Sendable {
    var path: String { get }
    var task: RequestTask { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
}

extension RequestType {
    var headers: [String: String] { [:] }

    func urlRequest(baseURL: URL) throws -> URLRequest {
        let url = path.isEmpty ? baseURL : baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        switch task {
        case .plain:
            return request
        case .parameterized(let encodedParameters):
            return try request.encoded(with: encodedParameters)
        case .composite(let bodyEncodedParameters, let urlParameters):
            return try request
                .encoded(with: bodyEncodedParameters)
                .encoded(with: EncodedParameters(encoding: URLEncoding.queryString, parameters: urlParameters))
        }
    }
}
