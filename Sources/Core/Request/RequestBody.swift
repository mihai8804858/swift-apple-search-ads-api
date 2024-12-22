import Foundation
import URLQueryEncoder

struct RequestBody: Sendable {
    typealias Value = any Encodable & Sendable

    let value: Value?
    let contentType: String
    let encode: @Sendable (Value?) throws -> Data?

    static func json(_ value: Value?) -> RequestBody {
        RequestBody(value: value, contentType: "application/json") { value in
            guard let value else { return nil }
            return try JSONEncoder.default.encode(value)
        }
    }

    static func form(_ value: Value?) -> RequestBody {
        RequestBody(value: value, contentType: "application/x-www-form-urlencoded") { value in
            guard let value else { return nil }
            let encoder = URLQueryEncoder.default
            encoder.encode(value, forKey: "value")
            guard let query = encoder.percentEncodedQuery else { return nil }
            return Data(query.utf8)
        }
    }
}
