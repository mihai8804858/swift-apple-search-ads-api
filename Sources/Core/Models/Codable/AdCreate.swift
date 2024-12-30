import Foundation

/// The request to create an ad, and assign a creative to an ad group.
public struct AdCreate: Codable, Equatable, Sendable {
    /// An `adId` is a unique identifier that represents the assignment relationship between an ad group and an Ad.
    public let id: Int?
    /// The identifier of the organization that owns the campaign.
    ///
    /// Your `orgId` is the same as your account in the Apple Search Ads UI.
    public let orgId: Int?
    /// The unique identifier for an ad group.
    public let adGroupId: Int?
    /// The unique identifier for a campaign.
    public let campaignId: Int?
    /// The unique identifier for a creative.
    public let creativeId: Int
    /// The unique name of the Ad assigned to an adgroup.
    ///
    /// Maximum Length: 255.
    public let name: String
    /// The type of creative.
    public let creativeType: Creative.Kind?
    /// Indicates whether an Ad is deleted.
    public let deleted: Bool?
    /// The status of the Ad.
    ///
    /// This field is updatable.
    public let status: Ad.Status
    /// The indicator of the status of an Ad assignment with an adgroup.
    public let servingStatus: Ad.ServingStatus?
    /// A list of reasons that displays when an Ad isn’t running.
    ///
    /// For example, if the `DeviceClass` changes, the `servingStateReasons` may change.
    public let servingStateReasons: [Ad.ServingStateReason]?
    /// The date and time of the creation of the Ad object.
    public let creationTime: Date?
    /// The date and time of the most recent modification of the ad.
    public let modificationTime: Date?

    public init(
        id: Int? = nil,
        orgId: Int? = nil,
        adGroupId: Int? = nil,
        campaignId: Int? = nil,
        creativeId: Int,
        name: String,
        creativeType: Creative.Kind? = nil,
        deleted: Bool? = nil,
        status: Ad.Status,
        servingStatus: Ad.ServingStatus? = nil,
        servingStateReasons: [Ad.ServingStateReason]? = nil,
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
}
