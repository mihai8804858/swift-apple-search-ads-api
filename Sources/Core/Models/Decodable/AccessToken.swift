import Foundation

struct AccessToken: Decodable, Equatable, Sendable {
    enum CodingKeys: String, CodingKey {
        case token = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
    }

    let token: String
    let tokenType: String
    let expiresIn: TimeInterval

    func isExpired(createdAt: Date) -> Bool {
        let expiryDate = createdAt.addingTimeInterval(expiresIn)
        let threshold = Date().addingTimeInterval(-10)
        return expiryDate <= threshold
    }
}
