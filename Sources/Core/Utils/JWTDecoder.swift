import Foundation

extension JWT.Token {
    var isExpired: Bool {
        do {
            let expiryDate = try JWTDecoder.decode(self).expiryDate
            let threshold = Date().addingTimeInterval(-10)
            return expiryDate <= threshold
        } catch {
            return true
        }
    }
}

struct DecodedJWT: Sendable {
    let expiryDate: Date
}

enum JWTDecoder: Sendable {
    enum DecodeError: LocalizedError, Sendable {
        case invalidBase64URL(String)
        case invalidJSON(String)
        case invalidPartCount(String, Int)

        public var localizedDescription: String {
            switch self {
            case .invalidJSON(let value): "Malformed JWT, failed to parse JSON value from base64URL \(value)"
            case .invalidPartCount(_, let parts): "Malformed JWT, has \(parts) parts when it should have 3 parts"
            case .invalidBase64URL(let value): "Malformed JWT, failed to decode base64URL value \(value)"
            }
        }
    }

    static func decode(_ token: JWT.Token) throws -> DecodedJWT {
        let parts = token.components(separatedBy: ".")
        guard parts.count == 3 else { throw DecodeError.invalidPartCount(token, parts.count) }
        let tokenBody = try decodeJWTPart(parts[1])
        guard let expiryTimestamp = tokenBody["exp"] as? Double else { throw DecodeError.invalidJSON(parts[1]) }
        let expiryDate = Date(timeIntervalSince1970: expiryTimestamp)

        return DecodedJWT(expiryDate: expiryDate)
    }

    // MARK: - Private

    private static func base64URLDecode(_ value: String) -> Data? {
        var base64 = value
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        let length = Double(base64.lengthOfBytes(using: .utf8))
        let requiredLength = 4 * ceil(length / 4.0)
        let paddingLength = requiredLength - length
        if paddingLength > 0 {
            base64 += "".padding(toLength: Int(paddingLength), withPad: "=", startingAt: 0)
        }

        return Data(base64Encoded: base64, options: .ignoreUnknownCharacters)
    }

    private static func decodeJWTPart(_ value: String) throws -> [String: Any] {
        guard let bodyData = base64URLDecode(value) else { throw DecodeError.invalidBase64URL(value) }
        guard let json = try? JSONSerialization.jsonObject(with: bodyData, options: []),
              let payload = json as? [String: Any] else {
            throw DecodeError.invalidJSON(value)
        }

        return payload
    }
}
