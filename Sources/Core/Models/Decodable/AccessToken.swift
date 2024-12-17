import Foundation

public struct AccessToken: Decodable, Sendable {
    enum CodingKeys: String, CodingKey {
        case token = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
    }

    public let token: String
    public let tokenType: String
    public let expiresIn: TimeInterval

    public init(token: String, tokenType: String, expiresIn: TimeInterval) {
        self.token = token
        self.tokenType = tokenType
        self.expiresIn = expiresIn
    }

    public func isExpired(createdAt: Date) -> Bool {
        let expiryDate = createdAt.addingTimeInterval(expiresIn)
        let threshold = Date().addingTimeInterval(-10)
        return expiryDate <= threshold
    }
}
