import Foundation

/// The response to a request to fetch keyword-level reports.
public struct ReportingKeyword: Codable, Hashable, Sendable, CodingKeysContaining, Identifiable {
    /// An indicator of whether the ad group is soft-deleted.
    public let adGroupDeleted: Bool?
    /// The unique identifier for the ad group the search term belongs to.
    public let adGroupId: Int?
    /// The name of the ad group, which is unique within the campaign. Responses don’t include deleted ad groups.
    public let adGroupName: String?
    /// The offer price for a keyword in a bidding auction.
    ///
    /// If the `bidAmount` field is null, the `bidAmount` uses the `defaultBidAmount` of the corresponding ad group.
    public let bidAmount: Money?
    /// The unique identifier for the campaign.
    public let campaignId: Int?
    /// An indicator of whether the search term is soft-deleted.
    public let deleted: Bool?
    /// The unique identifier for a keyword that belongs to an ad group.
    public let keywordId: Int?
    /// The targeting or negative keywords.
    public let keyword: String?
    /// The condition of the keyword.
    public let keywordStatus: KeywordStatus?
    /// The state of the keyword display operation.
    public let keywordDisplayStatus: KeywordDisplayStatus?
    /// An automated keyword and bidding strategy.
    public let matchType: KeywordMatchType?
    /// The identifier of the organization that owns the campaign.
    ///
    /// Your `orgId` is the same as your account in the Apple Search Ads UI.
    public let orgId: Int?
    /// The date and time of the most recent modification of the object.
    public let modificationTime: Date?
    /// Reporting device class.
    public let deviceClass: String?
    /// Reporting gender.
    public let gender: String?
    /// Reporting age range.
    public let ageRange: String?
    /// Reporting country or region.
    public let countryOrRegion: String?
    /// Reporting administrative area.
    public let adminArea: String?
    /// Reporting locality.
    public let locality: String?

    public var id: Int? { keywordId }

    public init(
        adGroupDeleted: Bool? = nil,
        adGroupId: Int? = nil,
        adGroupName: String? = nil,
        bidAmount: Money? = nil,
        campaignId: Int? = nil,
        deleted: Bool? = nil,
        keywordId: Int? = nil,
        keyword: String? = nil,
        keywordStatus: KeywordStatus? = nil,
        keywordDisplayStatus: KeywordDisplayStatus? = nil,
        matchType: KeywordMatchType? = nil,
        orgId: Int? = nil,
        modificationTime: Date? = nil,
        deviceClass: String? = nil,
        gender: String? = nil,
        ageRange: String? = nil,
        countryOrRegion: String? = nil,
        adminArea: String? = nil,
        locality: String? = nil
    ) {
        self.adGroupDeleted = adGroupDeleted
        self.adGroupId = adGroupId
        self.adGroupName = adGroupName
        self.bidAmount = bidAmount
        self.campaignId = campaignId
        self.deleted = deleted
        self.keywordId = keywordId
        self.keyword = keyword
        self.keywordStatus = keywordStatus
        self.keywordDisplayStatus = keywordDisplayStatus
        self.matchType = matchType
        self.orgId = orgId
        self.modificationTime = modificationTime
        self.deviceClass = deviceClass
        self.gender = gender
        self.ageRange = ageRange
        self.countryOrRegion = countryOrRegion
        self.adminArea = adminArea
        self.locality = locality
    }

    public enum CodingKeys: String, CodingKey {
        case adGroupDeleted
        case adGroupId
        case adGroupName
        case bidAmount
        case campaignId
        case deleted
        case keywordId
        case keyword
        case keywordStatus
        case keywordDisplayStatus
        case matchType
        case orgId
        case modificationTime
        case deviceClass
        case gender
        case ageRange
        case countryOrRegion
        case adminArea
        case locality
    }
}
