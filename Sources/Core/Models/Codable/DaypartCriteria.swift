/// The defined targeted audience to include for a specific time of day.
public struct DaypartCriteria: Codable, Equatable, Sendable {
    /// The dimension to target criteria for a specific time of day.
    /// Numbers ranging from 0 to 167 represent the hours of a week beginning at Sunday 12:00 midnight.
    /// For example, the hour beginning Monday at 1:00 a.m. is 25.
    public let userTime: DaypartDetail

    public init(userTime: DaypartDetail) {
        self.userTime = userTime
    }
}
