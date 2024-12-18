import Foundation

struct URLParameters: @unchecked Sendable {
    let parameters: Any

    var isEmpty: Bool {
        if let dictionary = parameters as? [String: Any] {
            return dictionary.isEmpty
        } else if let array = parameters as? [Any] {
            return array.isEmpty
        } else {
            return false
        }
    }

    init(_ parameters: [String: Any?]) {
        self.parameters = parameters.compactMapValues { $0 }
    }

    init(_ parameters: [Any?]) {
        self.parameters = parameters.compactMap { $0 }
    }

    init<T: Encodable>(encoding object: T?) throws {
        if let object {
            let data = try JSONEncoder.default.encode(object)
            let parameters = try JSONSerialization.jsonObject(with: data)
            self.parameters = parameters
        } else {
            self.parameters = [:]
        }
    }
}
