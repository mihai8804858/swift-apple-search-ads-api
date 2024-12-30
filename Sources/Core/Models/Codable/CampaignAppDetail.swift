/// The app data to fetch from campaign-level reports.
public struct CampaignAppDetail: Codable, Equatable, Sendable {
    /// Displays as `app:{adamId}` in `ReportingCampaign`.
    ///
    /// Each time you use an `adamId` in the API, it must match the `adamId` in your campaign.
    /// Use Get a Campaign or Get all Campaigns to obtain your `adamId` and correlate it to the correct campaign.
    public let adamId: Int?
    /// The App Store Connect app identifier, which displays as `app:{appName}` in `ReportingCampaign`.
    public let appName: String?

    public init(adamId: Int? = nil, appName: String? = nil) {
        self.adamId = adamId
        self.appName = appName
    }
}
