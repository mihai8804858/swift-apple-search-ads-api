import Foundation

extension URLRequest {
    var absoluteStringWithoutQuery: String? {
        guard let url = url, var components = URLComponents(string: url.absoluteString) else { return nil }
        components.query = nil

        return components.string
    }

    func adding(headers: [String: String], replace: Bool) -> URLRequest {
        var request = self
        for header in headers {
            if replace {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            } else {
                request.addValue(header.value, forHTTPHeaderField: header.key)
            }
        }

        return request
    }

    func adding(queries: [String: String], replace: Bool) -> URLRequest {
        guard let url = url?.absoluteString, var components = URLComponents(string: url) else { return self }
        let queries = queries.map { URLQueryItem(name: $0.key, value: $0.value) }
        components = components.adding(queries: queries, replace: replace)
        guard let newURL = components.url else { return self }
        var newRequest = self
        newRequest.url = newURL

        return newRequest
    }

    func encoded(with encodedParameters: EncodedParameters) throws -> URLRequest {
        try encodedParameters.encoding.encode(request: self, with: encodedParameters.parameters)
    }
}
