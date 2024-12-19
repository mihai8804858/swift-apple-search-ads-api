import Foundation

/// The response to ad group requests.
public struct AdGroup: Codable, Equatable, Sendable {
    /// The unique identifier for the ad group that you can use as adGroupId in endpoint resources.
    public let id: Int
    /// The identifier of the organization that owns the campaign.
    /// Your orgId is the same as your account in the Apple Search Ads UI.
    public let orgId: Int
    /// The unique identifier for a campaign.
    public let campaignId: Int
    /// The user-controlled status to enable or pause the ad group.
    ///
    /// This field is updatable.
    public let status: AdGroupStatus
    /// The status of whether the ad group is serving.
    public let servingStatus: AdGroupServingStatus
    /// A list of reasons that displays when an ad group isn’t running.
    public let servingStateReasons: [AdGroupServingStateReasons]
    /// The status of the ad group. The status resolves according to servingStatus and additional criteria.
    public let displayStatus: AdGroupDisplayStatus
    /// The unique name of the ad group. Responses don’t include deleted ad groups.
    public let name: String
    /// The type of pricing model for a bid.
    public let pricingModel: PricingModel
    /// The payment model that you set through the Search Ads UI.
    public let paymentModel: PaymentModel
    /// The default maximum cost-per-tap or cost-per-impression bid for the ad group.
    public let defaultBidAmount: Money
    /// The cost-per-acquisition goal.
    ///
    ///  You can update the cpaGoal only in campaigns that use the `APPSTORE_SEARCH_RESULTS` supply source.
    public let cpaGoal: Money
    /// The indicator of whether the ad group is soft-deleted. This includes keywords that belong to an ad group.
    public let deleted: Bool
    /// The parameter for enabling and disabling Search Match.
    /// If true, the system automatically adds optimized keywords in addition to those you explicitly add to the group.
    public let automatedKeywordsOptIn: Bool
    /// The date and time of the most recent modification of the object.
    public let modificationTime: Date
    /// The scheduled start date and time for the ad group with the earliest start time in the campaign.
    ///
    /// The startTime must be greater than the current time, and before the campaign endTime, if you set it.
    /// If you don’t set a startTime, the campaign defaults to the campaign request timestamp and the startTime
    /// is updatable until you reach the designated time.
    /// The startTime must be in UTC.
    public let startTime: Date
    /// The scheduled end time and date for the ad group,
    /// which the system determines from the ad group with the latest end time.
    ///
    /// The endTime must be after the startTime.
    /// The endTime is updatable until you reach the designated time.
    /// The endTime must be in UTC.
    public let endTime: Date
    /// The targeting criteria to narrow the audience.
    public let targetingDimensions: TargetingDimensions

    public init(
        id: Int,
        orgId: Int,
        campaignId: Int,
        status: AdGroupStatus,
        servingStatus: AdGroupServingStatus,
        servingStateReasons: [AdGroupServingStateReasons],
        displayStatus: AdGroupDisplayStatus,
        name: String,
        pricingModel: PricingModel,
        paymentModel: PaymentModel,
        defaultBidAmount: Money,
        cpaGoal: Money,
        deleted: Bool,
        automatedKeywordsOptIn: Bool,
        modificationTime: Date,
        startTime: Date,
        endTime: Date,
        targetingDimensions: TargetingDimensions
    ) {
        self.id = id
        self.orgId = orgId
        self.campaignId = campaignId
        self.status = status
        self.servingStatus = servingStatus
        self.servingStateReasons = servingStateReasons
        self.displayStatus = displayStatus
        self.name = name
        self.pricingModel = pricingModel
        self.paymentModel = paymentModel
        self.defaultBidAmount = defaultBidAmount
        self.cpaGoal = cpaGoal
        self.deleted = deleted
        self.automatedKeywordsOptIn = automatedKeywordsOptIn
        self.modificationTime = modificationTime
        self.startTime = startTime
        self.endTime = endTime
        self.targetingDimensions = targetingDimensions
    }
}
