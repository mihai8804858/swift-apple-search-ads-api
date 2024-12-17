/// The API caller identifiers.
public struct MeDetail: Decodable, Equatable, Sendable {
    /// The identifier of the API caller.
    public let userId: Int
    /// The account parent organization identifier.
    public let parentOrgId: Int

    /// Create an instance of `MeDetail`.
    ///
    /// - Parameters:
    ///     - userId: The identifier of the API caller.
    ///     - parentOrgId: The account parent organization identifier.
    public init(userId: Int, parentOrgId: Int) {
        self.userId = userId
        self.parentOrgId = parentOrgId
    }
}
