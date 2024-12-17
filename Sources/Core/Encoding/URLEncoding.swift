import Foundation

struct URLEncoding: ParameterEncoding {
    enum ArrayEncoding {
        case brackets
        case noBrackets

        func encode(key: String) -> String {
            switch self {
            case .brackets: "\(key)[]"
            case .noBrackets: key
            }
        }
    }

    enum BoolEncoding {
        case numeric
        case literal

        func encode(value: Bool) -> String {
            switch self {
            case .numeric: value ? "1" : "0"
            case .literal: value ? "true" : "false"
            }
        }
    }

    static let `default` = URLEncoding(destination: .methodDependent, arrayEncoding: .brackets, boolEncoding: .literal)
    static let queryString = URLEncoding(destination: .queryString, arrayEncoding: .brackets, boolEncoding: .literal)
    static let httpBody = URLEncoding(destination: .httpBody, arrayEncoding: .brackets, boolEncoding: .literal)

    let destination: ParameterDestination
    let arrayEncoding: ArrayEncoding
    let boolEncoding: BoolEncoding

    func encode(request: URLRequest, with parameters: URLParameters) throws -> URLRequest {
        var encodedRequest = request
        if let method = encodedRequest.httpMethod, encodesParametersInURL(with: HTTPMethod(rawValue: method) ?? .get) {
            guard let url = encodedRequest.url else { return encodedRequest }
            if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
               !parameters.parameters.isEmpty {
                let percentEncodedQuery = urlComponents.percentEncodedQuery.map { $0 + "&" } ?? ""
                let parametersQuery = query(from: parameters.parameters)
                urlComponents.percentEncodedQuery = percentEncodedQuery + parametersQuery
                encodedRequest.url = urlComponents.url
            }
        } else {
            encodedRequest.httpBody = Data(query(from: parameters.parameters).utf8)
            encodedRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }

        return encodedRequest
    }

    private func queryComponents(fromKey key: String, value: Any) -> [(String, String)] {
        var components: [(String, String)] = []
        if let dictionary = value as? [String: Any] {
            for (nestedKey, value) in dictionary {
                components += queryComponents(fromKey: "\(key)[\(nestedKey)]", value: value)
            }
        } else if let array = value as? [Any] {
            for value in array {
                components += queryComponents(fromKey: arrayEncoding.encode(key: key), value: value)
            }
        } else if let value = value as? NSNumber {
            let escapedValue = value.isBool ?
                (escape(key), escape(boolEncoding.encode(value: value.boolValue))) :
                (escape(key), escape("\(value)"))
            components.append(escapedValue)
        } else if let bool = value as? Bool {
            components.append((escape(key), escape(boolEncoding.encode(value: bool))))
        } else {
            components.append((escape(key), escape("\(value)")))
        }

        return components
    }

    private func escape(_ string: String) -> String {
        string.addingPercentEncoding(withAllowedCharacters: .queryAllowed) ?? string
    }

    private func query(from parameters: [String: Any]) -> String {
        var components: [(String, String)] = []
        for (key, value) in parameters.sorted(by: { $0.key < $1.key }) {
            components += queryComponents(fromKey: key, value: value)
        }

        return components.map { "\($0)=\($1)" }.joined(separator: "&")
    }

    private func encodesParametersInURL(with method: HTTPMethod) -> Bool {
        switch (destination, method) {
        case (_, .get), (_, .delete): true
        case (.queryString, _): true
        case (.httpBody, _): false
        default: false
        }
    }
}

private extension NSNumber {
    var isBool: Bool {
        CFBooleanGetTypeID() == CFGetTypeID(self)
    }
}
