/// The date range of the report request.
public enum CustomReportDateRange: String, Codable, Hashable, Sendable {
    case custom = "CUSTOM"
    case lastWeek = "LAST_WEEK"
    case last2Weeks = "LAST_2_WEEKS"
    case last4Weeks = "LAST_4_WEEKS"
}
