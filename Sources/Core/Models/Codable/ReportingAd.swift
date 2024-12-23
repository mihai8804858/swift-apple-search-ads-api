import Foundation

/// The response to a request to fetch ad-level reports.
public struct ReportingAd: Codable, Equatable, Sendable {
    /// A unique identifier that represents the assignment relationship between an ad group and an ad.
    public let adId: Int
    /// The unique identifier for the ad group the creative belongs to.
    ///
    /// You can use this field with the `orderBy` selector.
    public let adGroupId: Int
    /// The unique identifier for a campaign.
    ///
    /// You can use this field with the `orderBy` selector.
    public let campaignId: Int
    /// The unique identifier for a creative.
    public let creativeId: Int
    /// The identifier of the organization that owns the campaign.
    ///
    /// Your `orgId` is the same as your account in the Apple Search Ads UI.
    /// You can use this field with the orderBy selector.
    public let orgId: Int
    /// A unique string to identify a product page on App Store Connect.
    public let productPageId: String
    /// The unique name of a custom product page. The adName has to be unique within its ad group.
    ///
    /// You can use this field with the `orderBy` selector.
    public let adName: String
    /// The type of creative asset.
    public let creativeType: Creative.Kind
    /// The status of creative assets.
    ///
    /// You can use this field with the `orderBy` selector.
    public let status: Creative.State
    /// The display status that derives from the ad’s serving status.
    public let adDisplayStatus: Ad.DisplayStatus
    /// A list of reasons that displays when an ad isn’t running.
    ///
    /// You can use this field with the `orderBy` selector.
    public let adServingStateReasons: [Ad.ServingStateReason]
    /// The language of the creative.
    public let language: String
    /// An indicator of whether a creative asset is soft-deleted..
    public let deleted: Bool
    /// The date and time of the creation of the `Ad` object.
    ///
    /// You can use this field with the `orderBy` selector.
    public let creationTime: Date
    /// The date and time of the most recent modification of the object.
    ///
    /// You can use this field with the `orderBy` selector.
    public let modificationTime: Date

    public init(
        adId: Int,
        adGroupId: Int,
        campaignId: Int,
        creativeId: Int,
        orgId: Int,
        productPageId: String,
        adName: String,
        creativeType: Creative.Kind,
        status: Creative.State,
        adDisplayStatus: Ad.DisplayStatus,
        adServingStateReasons: [Ad.ServingStateReason],
        language: String,
        deleted: Bool,
        creationTime: Date,
        modificationTime: Date
    ) {
        self.adId = adId
        self.adGroupId = adGroupId
        self.campaignId = campaignId
        self.creativeId = creativeId
        self.orgId = orgId
        self.productPageId = productPageId
        self.adName = adName
        self.creativeType = creativeType
        self.status = status
        self.adDisplayStatus = adDisplayStatus
        self.adServingStateReasons = adServingStateReasons
        self.language = language
        self.deleted = deleted
        self.creationTime = creationTime
        self.modificationTime = modificationTime
    }
}