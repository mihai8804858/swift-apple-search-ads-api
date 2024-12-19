/// The status of whether the ad group is enabled or not.
public enum AdGroupStatus: String, Codable, Equatable, Sendable {
    /// The adgroup is serving.
    case enabled = "ENABLED"
    /// The adgroup is paused.
    case paused = "PAUSED"
}
