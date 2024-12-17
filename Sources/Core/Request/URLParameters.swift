import Foundation

struct URLParameters: @unchecked Sendable {
    let parameters: [String: Any]

    init(_ parameters: [String: Any?]) {
        self.parameters = parameters.compactMapValues { $0 }
    }

    init<T: Encodable>(encoding object: T?) throws {
        if let object {
            let data = try JSONEncoder.default.encode(object)
            let parameters = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            self.parameters = parameters ?? [:]
        } else {
            self.parameters = [:]
        }
    }
}
