import Foundation

/// The response to ad group requests.
public struct Ad: Codable, Hashable, Sendable, CodingKeysContaining, Identifiable {
    /// The user-controlled status of the ad.
    public enum Status: String, Codable, Hashable, Sendable {
        /// The ad is enabled.
        case enabled = "ENABLED"
        /// The ad is paused.
        case paused = "PAUSED"
    }

    /// The display status that derives from the ad’s serving status.
    public enum DisplayStatus: String, Codable, Hashable, Sendable {
        /// The ad is active.
        case active = "ACTIVE"
        /// The ad is invalid.
        case invalid = "INVALID"
        /// The ad is on hold.
        case onHold = "ON_HOLD"
        /// The ad is paused.
        case paused = "PAUSED"
        /// The ad is removed.
        case removed = "REMOVED"
    }

    /// The status of whether the ad is serving.
    public enum ServingStatus: String, Codable, Hashable, Sendable {
        /// The ad is running.
        case running = "RUNNING"
        /// The ad isn’t running.
        case notRunning = "NOT_RUNNING"
    }

    /// Reasons the system provides when an ad isn’t running.
    public enum ServingStateReason: String, Codable, Hashable, Sendable {
        /// The ad is approved.
        case adApprovalPending = "AD_APPROVAL_PENDING"
        /// The ad is rejected. The system doesn’t serve rejected ads.
        case adApprovalRejected = "AD_APPROVAL_REJECTED"
        /// The ad status is processing.
        case adProcessingInProgress = "AD_PROCESSING_IN_PROGRESS"
        /// The Creative Set aren’t supported.
        case creativeSetInvalid = "CREATIVE_SET_INVALID"
        /// Creative Sets aren’t supported.
        case creativeSetUnsupported = "CREATIVE_SET_UNSUPPORTED"
        /// The user has deleted the ad.
        case deletedByUser = "DELETED_BY_USER"
        /// The user has paused the ad.
        case pausedByUser = "PAUSED_BY_USER"
        /// The system has paused the ad.
        case pausedBySystem = "PAUSED_BY_SYSTEM"
        /// The product page has been deleted from App Store Connect.
        case productPageDeleted = "PRODUCT_PAGE_DELETED"
        /// The product page is hidden on App Store Connect.
        case productPageHidden = "PRODUCT_PAGE_HIDDEN"
        /// The product page is incompatible.
        case productPageIncompatible = "PRODUCT_PAGE_INCOMPATIBLE"
        /// The product page contains an insufficient number of assets.
        case productPageInsufficientAssets = "PRODUCT_PAGE_INSUFFICIENT_ASSETS"
    }

    /// An `adId` is a unique identifier that represents the assignment relationship between an adgroup and an ad.
    public let id: Int?
    /// The identifier of the organization that owns the campaign.
    ///
    /// Your `orgId` is the same as your account in the Apple Search Ads UI.
    public let orgId: Int?
    /// The unique identifier for an adgroup.
    public let adGroupId: Int?
    /// The unique identifier for a campaign.
    public let campaignId: Int?
    /// The unique identifier for a creative.
    ///
    /// This field is required in requests to Create an Ad.
    public let creativeId: Int?
    /// The unique name of the ad assigned to an ad group.
    ///
    /// This field is required in requests to Create an Ad and Update an Ad.
    /// The name field is synonymous with the `adName` field in `ReportingAd`.
    /// Maximum Length: 255.
    public let name: String?
    /// The type of creative. See `Creative.Kind` for value descriptions.
    ///
    /// You can create one creative per custom product page per organization.
    public let creativeType: Creative.Kind?
    /// Indicates whether an ad is deleted.
    public let deleted: Bool?
    /// The status of the ad.
    ///
    /// This field is required in requests to Create an Ad and Update an Ad.
    public let status: Status?
    /// The indicator of the status of an ad assignment with an ad group.
    public let servingStatus: ServingStatus?
    /// A list of reasons that displays when an ad isn’t running.
    ///
    /// For example, if the `DeviceClass` changes, the `servingStateReasons` may change.
    public let servingStateReasons: [ServingStateReason]?
    /// The date and time of the creation of the Ad object.
    public let creationTime: Date?
    /// The date and time of the most recent modification of the ad.
    public let modificationTime: Date?

    public init(
        id: Int? = nil,
        orgId: Int? = nil,
        adGroupId: Int? = nil,
        campaignId: Int? = nil,
        creativeId: Int? = nil,
        name: String? = nil,
        creativeType: Creative.Kind? = nil,
        deleted: Bool? = nil,
        status: Status? = nil,
        servingStatus: ServingStatus? = nil,
        servingStateReasons: [ServingStateReason]? = nil,
        creationTime: Date? = nil,
        modificationTime: Date? = nil
    ) {
        self.id = id
        self.orgId = orgId
        self.adGroupId = adGroupId
        self.campaignId = campaignId
        self.creativeId = creativeId
        self.name = name
        self.creativeType = creativeType
        self.deleted = deleted
        self.status = status
        self.servingStatus = servingStatus
        self.servingStateReasons = servingStateReasons
        self.creationTime = creationTime
        self.modificationTime = modificationTime
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case orgId
        case adGroupId
        case campaignId
        case creativeId
        case name
        case creativeType
        case deleted
        case status
        case servingStatus
        case servingStateReasons
        case creationTime
        case modificationTime
    }
}
