import Foundation

public struct MeDetail: Decodable, Sendable {
    public let userId: Int
    public let parentOrgId: Int

    public init(userId: Int, parentOrgId: Int) {
        self.userId = userId
        self.parentOrgId = parentOrgId
    }
}
