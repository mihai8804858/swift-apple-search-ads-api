/// The API caller identifiers.
public struct MeDetail: Codable, Equatable, Sendable {
    /// The identifier of the API caller.
    public let userId: Int
    /// The account parent organization identifier.
    public let parentOrgId: Int

    public init(userId: Int, parentOrgId: Int) {
        self.userId = userId
        self.parentOrgId = parentOrgId
    }
}
