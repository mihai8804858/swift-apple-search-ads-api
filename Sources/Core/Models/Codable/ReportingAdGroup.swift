import Foundation

/// The response to a request to fetch ad group-level reports.
public struct ReportingAdGroup: Codable, Hashable, Sendable, CodingKeysContaining, Identifiable {
    /// The state of the operation.
    public let adGroupDisplayStatus: AdGroup.DisplayStatus?
    /// The identifier for the ad group.
    public let adGroupId: Int?
    /// The name of the ad group. This is unique within the campaign. Reports don’t include deleted ad groups.
    public let adGroupName: String?
    /// A list of reasons that displays when an ad group isn’t running.
    public let adGroupServingStateReasons: [AdGroup.ServingStateReasons]?
    /// The status of whether the ad group is serving.
    public let adGroupServingStatus: AdGroup.ServingStatus?
    /// The status of the ad group.
    public let adGroupStatus: AdGroup.Status?
    /// The parameter for enabling and disabling Search Match.
    ///
    /// If true, the system automatically adds optimized keywords in addition to those you explicitly add to the group.
    public let automatedKeywordsOptIn: Bool?
    /// The unique identifier for the campaign.
    public let campaignId: Int?
    /// The cost-per-acquisition goal.
    public let cpaGoal: Money?
    /// The default maximum cost per tap or impression bid for the ad group.
    public let defaultBidAmount: Money?
    /// The indicator of whether the ad group is soft-deleted. This includes keywords that belong to an ad group.
    public let deleted: Bool?
    /// The scheduled start date and time for the ad group.
    public let startTime: Date?
    /// The scheduled end date and time for the ad group.
    public let endTime: Date?
    /// The date and time of the most recent modification of the object.
    public let modificationTime: Date?
    /// The identifier of the organization that owns the campaign.
    ///
    /// Your `orgId` is the same as your account in the Apple Search Ads UI.
    public let orgId: Int?
    /// Reporting device class.
    public let deviceClass: DeviceClass?
    /// Reporting gender.
    public let gender: Gender?
    /// Reporting age range.
    public let ageRange: AgeRange?
    /// Reporting country or region.
    public let countryOrRegion: String?
    /// Reporting administrative area.
    public let adminArea: String?
    /// Reporting locality.
    public let locality: String?

    public var id: Int? { adGroupId }

    public init(
        adGroupDisplayStatus: AdGroup.DisplayStatus? = nil,
        adGroupId: Int? = nil,
        adGroupName: String? = nil,
        adGroupServingStateReasons: [AdGroup.ServingStateReasons]? = nil,
        adGroupServingStatus: AdGroup.ServingStatus? = nil,
        adGroupStatus: AdGroup.Status? = nil,
        automatedKeywordsOptIn: Bool? = nil,
        campaignId: Int? = nil,
        cpaGoal: Money? = nil,
        defaultBidAmount: Money? = nil,
        deleted: Bool? = nil,
        startTime: Date? = nil,
        endTime: Date? = nil,
        modificationTime: Date? = nil,
        orgId: Int? = nil,
        deviceClass: DeviceClass? = nil,
        gender: Gender? = nil,
        ageRange: AgeRange? = nil,
        countryOrRegion: String? = nil,
        adminArea: String? = nil,
        locality: String? = nil
    ) {
        self.adGroupDisplayStatus = adGroupDisplayStatus
        self.adGroupId = adGroupId
        self.adGroupName = adGroupName
        self.adGroupServingStateReasons = adGroupServingStateReasons
        self.adGroupServingStatus = adGroupServingStatus
        self.adGroupStatus = adGroupStatus
        self.automatedKeywordsOptIn = automatedKeywordsOptIn
        self.campaignId = campaignId
        self.cpaGoal = cpaGoal
        self.defaultBidAmount = defaultBidAmount
        self.deleted = deleted
        self.startTime = startTime
        self.endTime = endTime
        self.modificationTime = modificationTime
        self.orgId = orgId
        self.deviceClass = deviceClass
        self.gender = gender
        self.ageRange = ageRange
        self.countryOrRegion = countryOrRegion
        self.adminArea = adminArea
        self.locality = locality
    }

    public enum CodingKeys: String, CodingKey {
        case adGroupDisplayStatus
        case adGroupId
        case adGroupName
        case adGroupServingStateReasons
        case adGroupServingStatus
        case adGroupStatus
        case automatedKeywordsOptIn
        case campaignId
        case cpaGoal
        case defaultBidAmount
        case deleted
        case startTime
        case endTime
        case modificationTime
        case orgId
        case deviceClass
        case gender
        case ageRange
        case countryOrRegion
        case adminArea
        case locality
    }
}
