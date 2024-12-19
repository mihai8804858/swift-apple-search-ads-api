/// A parent object of the error response body.
public struct ErrorResponse: Codable, Equatable, Sendable {
    /// The error response details in the response body.
    public struct Item: Equatable, Codable, Sendable {
        /// The details regarding an error.
        public let field: String?
        /// A nonlocalized (U.S. English only) user-friendly string that describes the error.
        public let message: String?
        /// A system-assigned error code.
        public let messageCode: String?

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

    /// A container for error message details.
    public let errors: [Item]

    public init(errors: [Item]) {
        self.errors = errors
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let errorContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .error)
        errors = try errorContainer.decode([Item].self, forKey: .errors)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var errorContainer = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .error)
        try errorContainer.encode(errors, forKey: .errors)
    }
}
