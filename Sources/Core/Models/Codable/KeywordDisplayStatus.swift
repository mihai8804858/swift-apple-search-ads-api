/// The state of the keyword display operation.
public enum KeywordDisplayStatus: String, Codable, Equatable, Sendable {
    /// The ad group is on hold.
    case adGroupOnHold = "AD_GROUP_ON_HOLD"
    /// The campaign is on hold.
    case campaignOnHold = "CAMPAIGN_ON_HOLD"
    /// The keyword is deleted.
    case deleted = "DELETED"
    /// The keyword is paused.
    case paused = "PAUSED"
    /// The keyword is running.
    case running = "RUNNING"
}
