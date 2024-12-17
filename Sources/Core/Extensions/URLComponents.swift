import Foundation

extension URLComponents {
    func adding(queries: [URLQueryItem], replace: Bool) -> URLComponents {
        var components = self
        guard var queryItems = components.percentEncodedQueryItems else {
            components.percentEncodedQueryItems = queries.map(\.urlQueryEncoded)
            return components
        }
        for query in queries {
            if let index = queryItems.firstIndex(where: { $0.name == query.name }) {
                if replace {
                    queryItems[index] = query.urlQueryEncoded
                }
            } else {
                queryItems.append(query.urlQueryEncoded)
            }
        }
        components.percentEncodedQueryItems = queryItems

        return components
    }
}
