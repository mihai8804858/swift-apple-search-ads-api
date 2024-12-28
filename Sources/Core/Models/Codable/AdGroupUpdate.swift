import Foundation

/// The response to ad group update requests.
public struct AdGroupUpdate: Codable, Equatable, Sendable {
    /// The user-controlled status to enable or pause the ad group.
    ///
    /// This field is updatable.
    public let status: AdGroup.Status?
    /// The unique name of the ad group. Responses don’t include deleted ad groups.
    public let name: String?
    /// The default maximum cost-per-tap or cost-per-impression bid for the ad group.
    public let defaultBidAmount: Money?
    /// The cost-per-acquisition goal.
    ///
    ///  You can update the cpaGoal only in campaigns that use the `APPSTORE_SEARCH_RESULTS` supply source.
    public let cpaGoal: Money?
    /// The parameter for enabling and disabling Search Match.
    /// If true, the system automatically adds optimized keywords in addition to those you explicitly add to the group.
    public let automatedKeywordsOptIn: Bool?
    /// The scheduled start date and time for the ad group with the earliest start time in the campaign.
    ///
    /// - The startTime must be greater than the current time, and before the campaign endTime, if you set it.
    /// - If you don’t set a startTime, the campaign defaults to the campaign request timestamp and the startTime
    /// is updatable until you reach the designated time.
    /// - The startTime must be in UTC.
    public let startTime: Date?
    /// The scheduled end time and date for the ad group,
    /// which the system determines from the ad group with the latest end time.
    ///
    /// - The endTime must be after the startTime.
    /// - The endTime is updatable until you reach the designated time.
    /// - The endTime must be in UTC.
    public let endTime: Date?
    /// The targeting criteria to narrow the audience.
    /// Targeting options include age, gender, geolocation, daypart, device, and app downloaders.
    public let targetingDimensions: TargetingDimensions?

    public init(
        status: AdGroup.Status? = nil,
        name: String? = nil,
        defaultBidAmount: Money? = nil,
        cpaGoal: Money? = nil,
        automatedKeywordsOptIn: Bool? = nil,
        startTime: Date? = nil,
        endTime: Date? = nil,
        targetingDimensions: TargetingDimensions? = nil
    ) {
        self.status = status
        self.name = name
        self.defaultBidAmount = defaultBidAmount
        self.cpaGoal = cpaGoal
        self.automatedKeywordsOptIn = automatedKeywordsOptIn
        self.startTime = startTime
        self.endTime = endTime
        self.targetingDimensions = targetingDimensions
    }
}
