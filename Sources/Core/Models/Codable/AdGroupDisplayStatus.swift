/// The status of the ad group.
public enum AdGroupDisplayStatus: String, Codable, Equatable, Sendable {
    /// The adgroup is running in the campaign.
    case running = "RUNNING"
    /// The adgroup is on hold.
    case onHold = "ON_HOLD"
    /// The adgroup is paused.
    case paused = "PAUSED"
    /// The adgroup has been deleted.
    case deleted = "DELETED"
}
