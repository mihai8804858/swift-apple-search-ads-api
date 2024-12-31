public protocol CodingKeysContaining: Sendable {
    associatedtype CodingKeys: CodingKey & Equatable
}

extension KeyedDecodingContainer {
    func decodeCodingKey<Root: CodingKeysContaining>(
        forKey key: Key,
        type: Root.Type
    ) throws -> Root.CodingKeys {
        let stringValue = try decode(String.self, forKey: key)
        guard let codingKey = Root.CodingKeys(stringValue: stringValue) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(
                codingPath: [key],
                debugDescription: "Unknown value: \(stringValue)"
            ))
        }

        return codingKey
    }

    func decodeCodingKeyIfPresent<Root: CodingKeysContaining>(
        forKey key: Key,
        type: Root.Type
    ) throws -> Root.CodingKeys? {
        guard let stringValue = try decodeIfPresent(String.self, forKey: key) else { return nil }
        guard let codingKey = Root.CodingKeys(stringValue: stringValue) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(
                codingPath: [key],
                debugDescription: "Unknown value: \(stringValue)"
            ))
        }

        return codingKey
    }

    func decodeCodingKeys<Root: CodingKeysContaining>(
        forKey key: Key,
        type: Root.Type
    ) throws -> [Root.CodingKeys] {
        let stringValues = try decode([String].self, forKey: key)
        return try stringValues.map { stringValue in
            guard let codingKey = Root.CodingKeys(stringValue: stringValue) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(
                    codingPath: [key],
                    debugDescription: "Unknown value: \(stringValue)"
                ))
            }

            return codingKey
        }
    }

    func decodeCodingKeysIfPresent<Root: CodingKeysContaining>(
        forKey key: Key,
        type: Root.Type
    ) throws -> [Root.CodingKeys]? {
        guard let stringValues = try decodeIfPresent([String].self, forKey: key) else { return nil }
        return try stringValues.map { stringValue in
            guard let codingKey = Root.CodingKeys(stringValue: stringValue) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(
                    codingPath: [key],
                    debugDescription: "Unknown value: \(stringValue)"
                ))
            }

            return codingKey
        }
    }
}

extension KeyedEncodingContainer {
    mutating func encodeCodingKey<Root: CodingKeysContaining>(
        _ value: Root.CodingKeys,
        forKey key: Key,
        type: Root.Type
    ) throws {
        try encode(value.stringValue, forKey: key)
    }

    mutating func encodeCodingKeyIfPresent<Root: CodingKeysContaining>(
        _ value: Root.CodingKeys?,
        forKey key: Key,
        type: Root.Type
    ) throws {
        guard let value else { return }
        try encodeCodingKey(value, forKey: key, type: type)
    }

    mutating func encodeCodingKeys<Root: CodingKeysContaining>(
        _ value: [Root.CodingKeys],
        forKey key: Key,
        type: Root.Type
    ) throws {
        try encode(value.map(\.stringValue), forKey: key)
    }

    mutating func encodeCodingKeysIfPresent<Root: CodingKeysContaining>(
        _ value: [Root.CodingKeys]?,
        forKey key: Key,
        type: Root.Type
    ) throws {
        guard let value else { return }
        try encodeCodingKeys(value, forKey: key, type: type)
    }
}
