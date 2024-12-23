/// The defined target audience to include using the age-range demographic.
public struct AgeRange: Codable, Equatable, Sendable {
    /// The dimension for specifying the minimum age for targeting. The minimum value is 18.
    public let minAge: Int
    /// The dimension for specifying the maximum age for targeting. This field may be null.
    public let maxAge: Int?

    public init(minAge: Int, maxAge: Int?) {
        self.minAge = minAge
        self.maxAge = maxAge
    }
}
