import Foundation

extension URLRequest {
    mutating func add(headers: [String: String], replace: Bool) {
        headers.forEach { add(header: $0.key, value: $0.value, replace: replace) }
    }

    mutating func add(header: String, value: String, replace: Bool) {
        if replace {
            setValue(value, forHTTPHeaderField: header)
        } else {
            addValue(value, forHTTPHeaderField: header)
        }
    }
}
