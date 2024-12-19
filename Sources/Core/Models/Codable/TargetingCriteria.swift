/// The defined targeted criteria.
public struct TargetingCriteria<Dimension: Codable & Equatable & Sendable>: Codable, Equatable, Sendable {
    /// The dimension to include targeting criteria values.
    public let included: [Dimension]?
    /// The dimension to exclude targeting criteria values.
    public let excluded: [Dimension]?

    public init(included: [Dimension]? = nil, excluded: [Dimension]? = nil) {
        self.included = included
        self.excluded = excluded
    }
}
