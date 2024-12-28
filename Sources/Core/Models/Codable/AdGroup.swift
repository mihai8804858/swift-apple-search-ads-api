import Foundation

/// The response to ad group requests.
public struct AdGroup: Codable, Equatable, Sendable {
    /// The status of whether the ad group is enabled or not.
    public enum Status: String, Codable, Equatable, Sendable {
        /// The adgroup is serving.
        case enabled = "ENABLED"
        /// The adgroup is paused.
        case paused = "PAUSED"
    }

    /// The status of whether the ad group is serving.
    public enum ServingStatus: String, Codable, Equatable, Sendable {
        /// The adgroup is running.
        case running = "RUNNING"
        /// The adgroup is not running.
        case notRunning = "NOT_RUNNING"
    }

    /// The status of the ad group.
    public enum DisplayStatus: String, Codable, Equatable, Sendable {
        /// The adgroup is running in the campaign.
        case running = "RUNNING"
        /// The adgroup is on hold.
        case onHold = "ON_HOLD"
        /// The campaign is on hold.
        case campaignOnHold = "CAMPAIGN_ON_HOLD"
        /// The adgroup is paused.
        case paused = "PAUSED"
        /// The adgroup has been deleted.
        case deleted = "DELETED"
    }

    /// A list of reasons that displays when an ad group isn’t running.
    public enum ServingStateReasons: String, Codable, Equatable, Sendable {
        /// The user paused the ad group.
        case adGroupPausedByUser = "AD_GROUP_PAUSED_BY_USER"
        /// The system can’t process the ad group data.
        case appNotSupport = "APP_NOT_SUPPORT"
        /// The user deleted the ad group.
        case deletedByUser = "DELETED_BY_USER"
        /// The ad group end date is in the past.
        case adGroupEndDateReached = "ADGROUP_END_DATE_REACHED"
        /// The targeting parameters are below the threshold.
        case audienceBelowThreshold = "AUDIENCE_BELOW_THRESHOLD"
        /// The campaign linked to the ad group ended.
        case campaignEndDateReached = "CAMPAIGN_END_DATE_REACHED"
        /// The campaign isn’t running.
        case campaignNotRunning = "CAMPAIGN_NOT_RUNNING"
        /// The campaign linked to the ad group is set to start at a future date.
        case campaignStartDateInFuture = "CAMPAIGN_START_DATE_IN_FUTURE"
        /// The ad group start date is in the future.
        case startDateInTheFuture = "START_DATE_IN_THE_FUTURE"
        /// The ad group has no available ads.
        case noAvailableAds = "NO_AVAILABLE_ADS"
        /// The targeting parameters are inaccurate.
        case pendingAudienceVerification = "PENDING_AUDIENCE_VERIFICATION"
        /// The targeting parameters are inaccurate.
        case targetedDeviceClassNotSupportedSupplySource = "TARGETED_DEVICE_CLASS_NOT_SUPPORTED_SUPPLY_SOURCE"
    }

    /// The unique identifier for the ad group that you can use as adGroupId in endpoint resources.
    public let id: Int?
    /// The identifier of the organization that owns the campaign.
    /// Your orgId is the same as your account in the Apple Search Ads UI.
    public let orgId: Int?
    /// The unique identifier for a campaign.
    public let campaignId: Int?
    /// The user-controlled status to enable or pause the ad group.
    ///
    /// This field is updatable.
    public let status: Status?
    /// The status of whether the ad group is serving.
    public let servingStatus: ServingStatus?
    /// A list of reasons that displays when an ad group isn’t running.
    public let servingStateReasons: [ServingStateReasons]?
    /// The status of the ad group. The status resolves according to servingStatus and additional criteria.
    public let displayStatus: DisplayStatus?
    /// The unique name of the ad group. Responses don’t include deleted ad groups.
    public let name: String
    /// The type of pricing model for a bid.
    public let pricingModel: PricingModel
    /// The payment model that you set through the Search Ads UI.
    public let paymentModel: PaymentModel?
    /// The default maximum cost-per-tap or cost-per-impression bid for the ad group.
    public let defaultBidAmount: Money
    /// The cost-per-acquisition goal.
    ///
    ///  You can update the cpaGoal only in campaigns that use the `APPSTORE_SEARCH_RESULTS` supply source.
    public let cpaGoal: Money?
    /// The indicator of whether the ad group is soft-deleted. This includes keywords that belong to an ad group.
    public let deleted: Bool?
    /// The parameter for enabling and disabling Search Match.
    /// If true, the system automatically adds optimized keywords in addition to those you explicitly add to the group.
    public let automatedKeywordsOptIn: Bool?
    /// The date and time of the most recent modification of the object.
    public let modificationTime: Date?
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
    public let endTime: Date?
    /// The targeting criteria to narrow the audience.
    public let targetingDimensions: TargetingDimensions?

    public init(
        id: Int? = nil,
        orgId: Int? = nil,
        campaignId: Int? = nil,
        status: Status? = nil,
        servingStatus: ServingStatus? = nil,
        servingStateReasons: [ServingStateReasons]? = nil,
        displayStatus: DisplayStatus? = nil,
        name: String,
        pricingModel: PricingModel,
        paymentModel: PaymentModel? = nil,
        defaultBidAmount: Money,
        cpaGoal: Money? = nil,
        deleted: Bool? = nil,
        automatedKeywordsOptIn: Bool? = nil,
        modificationTime: Date? = nil,
        startTime: Date,
        endTime: Date? = nil,
        targetingDimensions: TargetingDimensions? = nil
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
