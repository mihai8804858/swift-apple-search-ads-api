import Foundation

public struct ErrorResponse: Decodable, Equatable, CustomDebugStringConvertible, Sendable {
    public struct Item: Equatable, Decodable, CustomDebugStringConvertible, Sendable {
        public let field: String?
        public let message: String?
        public let messageCode: String?

        public var debugDescription: String {
            "field: \(field ?? "nil"), messageCode: \(messageCode ?? "nil"), message: \(message ?? "nil")"
        }

        public init(field: String, message: String, messageCode: String) {
            self.field = field
            self.message = message
            self.messageCode = messageCode
        }
    }

    enum CodingKeys: CodingKey {
        case error
        case errors
    }

    public let errors: [Item]

    public init(errors: [Item]) {
        self.errors = errors
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let errorContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .error)
        errors = try errorContainer.decode([Item].self, forKey: .errors)
    }

    public var debugDescription: String {
        String.build {
            "("
            for error in errors {
                "\t"
                error.debugDescription
                "\n"
            }
            ")"
        }
    }
}
