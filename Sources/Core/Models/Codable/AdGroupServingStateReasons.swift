/// A list of reasons that displays when an ad group isn’t running.
public enum AdGroupServingStateReasons: String, Codable, Equatable, Sendable {
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
