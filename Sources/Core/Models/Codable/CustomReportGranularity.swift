/// The report data organized by day or week.
public enum CustomReportGranularity: String, Codable, Equatable, Sendable {
    case daily = "DAILY"
    case weekly = "WEEKLY"
}
