import Foundation

extension URLRequest {
    var absoluteStringWithoutQuery: String? {
        guard let url = url, var components = URLComponents(string: url.absoluteString) else { return nil }
        components.query = nil

        return components.string
    }

    mutating func add(headers: [String: String], replace: Bool) {
        for header in headers {
            if replace {
                setValue(header.value, forHTTPHeaderField: header.key)
            } else {
                addValue(header.value, forHTTPHeaderField: header.key)
            }
        }
    }

    func adding(headers: [String: String], replace: Bool) -> URLRequest {
        var request = self
        request.add(headers: headers, replace: replace)

        return request
    }

    mutating func add(queries: [String: String], replace: Bool) {
        guard let urlString = url?.absoluteString, var components = URLComponents(string: urlString) else { return }
        let queries = queries.map { URLQueryItem(name: $0.key, value: $0.value) }
        components = components.adding(queries: queries, replace: replace)
        guard let newURL = components.url else { return }
        url = newURL
    }

    func adding(queries: [String: String], replace: Bool) -> URLRequest {
        var request = self
        request.add(queries: queries, replace: replace)

        return request
    }
}
