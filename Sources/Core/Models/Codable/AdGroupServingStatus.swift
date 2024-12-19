/// The status of whether the ad group is serving.
public enum AdGroupServingStatus: String, Codable, Equatable, Sendable {
    /// The adgroup is running.
    case running = "RUNNING"
    /// The adgroup is not running.
    case notRunning = "NOT_RUNNING"
}
