import Foundation

/// The request to update an ad.
public struct AdUpdate: Codable, Hashable, Sendable, Identifiable {
    /// An `adId` is a unique identifier that represents the assignment relationship between an ad group and an Ad.
    public let id: NullCodable<Int>?
    /// The identifier of the organization that owns the campaign.
    ///
    /// Your `orgId` is the same as your account in the Apple Search Ads UI.
    public let orgId: NullCodable<Int>?
    /// The unique identifier for an ad group.
    public let adGroupId: NullCodable<Int>?
    /// The unique identifier for a campaign.
    public let campaignId: NullCodable<Int>?
    /// The unique identifier for a creative.
    public let creativeId: NullCodable<Int>?
    /// The unique name of the Ad assigned to an adgroup.
    ///
    /// Maximum Length: 255.
    public let name: NullCodable<String>?
    /// The type of creative.
    public let creativeType: NullCodable<Creative.Kind>?
    /// Indicates whether an Ad is deleted.
    public let deleted: NullCodable<Bool>?
    /// The status of the Ad.
    ///
    /// This field is updatable.
    public let status: NullCodable<Ad.Status>?
    /// The indicator of the status of an Ad assignment with an adgroup.
    public let servingStatus: NullCodable<Ad.ServingStatus>?
    /// A list of reasons that displays when an Ad isn’t running.
    ///
    /// For example, if the `DeviceClass` changes, the `servingStateReasons` may change.
    public let servingStateReasons: NullCodable<[Ad.ServingStateReason]>?
    /// The date and time of the creation of the Ad object.
    public let creationTime: NullCodable<Date>?
    /// The date and time of the most recent modification of the ad.
    public let modificationTime: NullCodable<Date>?

    public init(
        id: NullCodable<Int>? = nil,
        orgId: NullCodable<Int>? = nil,
        adGroupId: NullCodable<Int>? = nil,
        campaignId: NullCodable<Int>? = nil,
        creativeId: NullCodable<Int>? = nil,
        name: NullCodable<String>? = nil,
        creativeType: NullCodable<Creative.Kind>? = nil,
        deleted: NullCodable<Bool>? = nil,
        status: NullCodable<Ad.Status>? = nil,
        servingStatus: NullCodable<Ad.ServingStatus>? = nil,
        servingStateReasons: NullCodable<[Ad.ServingStateReason]>? = nil,
        creationTime: NullCodable<Date>? = nil,
        modificationTime: NullCodable<Date>? = nil
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
