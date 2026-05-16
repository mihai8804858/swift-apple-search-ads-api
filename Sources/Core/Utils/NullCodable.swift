public struct NullCodable<T: Codable>: Codable {
    public let wrappedValue: T?

    public init(_ wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }

    enum CodingKeys: CodingKey {
        case wrappedValue
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = container.decodeNil() ? nil : try container.decode(T.self)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch wrappedValue {
        case .some(let value): try container.encode(value)
        case .none: try container.encodeNil()
        }
    }
}

extension NullCodable: Sendable where T: Sendable {}
extension NullCodable: Equatable where T: Equatable {}
extension NullCodable: Hashable where T: Hashable {}
