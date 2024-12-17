/// A parent object of the error response body.
public struct ErrorResponse: Decodable, Equatable, Sendable {
    /// The error response details in the response body.
    public struct Item: Equatable, Decodable, Sendable {
        /// The details regarding an error.
        public let field: String?
        /// A nonlocalized (U.S. English only) user-friendly string that describes the error.
        public let message: String?
        /// A system-assigned error code.
        public let messageCode: String?

        /// Create an instance of `Item`.
        ///
        /// - Parameters:
        ///     - field: The details regarding an error.
        ///     - message: A nonlocalized (U.S. English only) user-friendly string that describes the error.
        ///     - messageCode: A system-assigned error code.
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

    /// Create an instance of `ErrorResponse`.
    ///
    /// - Parameters:
    ///     - errors: A container for error message details.
    public init(errors: [Item]) {
        self.errors = errors
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let errorContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .error)
        errors = try errorContainer.decode([Item].self, forKey: .errors)
    }
}
