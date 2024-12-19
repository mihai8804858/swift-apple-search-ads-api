/// The user-controlled status to enable or pause the keyword.
public enum KeywordStatus: String, Codable, Equatable, Sendable {
    /// The keyword is active.
    case active = "ACTIVE"
    /// The keyword is paused.
    case paused = "PAUSED"
}
