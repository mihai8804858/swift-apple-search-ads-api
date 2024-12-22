import Foundation
import URLQueryEncoder

struct RequestQuery: Sendable {
    typealias Value = any Encodable & Sendable

    let value: Value?

    init(_ value: Value?) {
        self.value = value
    }

    func encode() -> [URLQueryItem]? {
        guard let value = value else { return nil }
        let encoder = URLQueryEncoder.default
        encoder.encode(value, forKey: "value")
        return encoder.queryItems
    }
}
