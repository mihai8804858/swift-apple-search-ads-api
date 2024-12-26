import Foundation
@preconcurrency import URLQueryEncoder

extension JSONDecoder {
    static var `default`: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}

extension JSONEncoder {
    static var `default`: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
        return encoder
    }
}

extension URLQueryEncoder {
    static var `default`: URLQueryEncoder {
        let encoder = URLQueryEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.isDeepObject = false
        encoder.explode = true
        encoder.delimiter = ","
        return encoder
    }
}
