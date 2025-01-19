/// The report data organized by day or week.
public enum CustomReportGranularity: String, Codable, Hashable, Sendable {
    case daily = "DAILY"
    case weekly = "WEEKLY"
}
