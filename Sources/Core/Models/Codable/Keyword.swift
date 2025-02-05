import Foundation

/// Targeting keyword parameters to use in requests and responses.
public struct Keyword: Codable, Hashable, Sendable, CodingKeysContaining, Identifiable {
    /// A unique identifier for the targeting keyword in the payload to update keyword bids or statuses.
    /// This id is specific to a particular ad group and match type that you use to update bid amounts.
    public let id: Int?
    /// The unique identifier for the campaign.
    public let campaignId: Int?
    /// The unique identifier for the ad group that the targeting keyword belongs to.
    public let adGroupId: Int?
    /// The word or phrase to match in App Store user searches to show your ad.
    public let text: String
    /// An automated keyword and bidding strategy.
    public let matchType: KeywordMatchType
    /// The user-controlled status to enable or pause the keyword.
    public let status: KeywordStatus?
    /// The maximum cost-per-tap/impression bid amount.
    ///
    /// This is the offer price for a keyword in a bidding auction.
    /// If the bidAmount field is null, the bidAmount uses the defaultBidAmount of the corresponding ad group.
    /// If you set `automatedKeywordsOptIn=true` in Update an Ad Group,
    /// the bid uses optimized keywords with the `defaultBidAmount`.
    public let bidAmount: Money?
    /// An indicator of whether the keyword is soft-deleted.
    public let deleted: Bool?
    /// The date and time of the creation of the keyword object.
    public let creationTime: Date?
    /// The date and time of the most recent modification of the object.
    public let modificationTime: Date?

    public init(
        id: Int? = nil,
        campaignId: Int? = nil,
        adGroupId: Int? = nil,
        text: String,
        matchType: KeywordMatchType,
        status: KeywordStatus? = nil,
        bidAmount: Money? = nil,
        deleted: Bool? = nil,
        creationTime: Date? = nil,
        modificationTime: Date? = nil
    ) {
        self.id = id
        self.campaignId = campaignId
        self.adGroupId = adGroupId
        self.text = text
        self.matchType = matchType
        self.status = status
        self.bidAmount = bidAmount
        self.deleted = deleted
        self.creationTime = creationTime
        self.modificationTime = modificationTime
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case campaignId
        case adGroupId
        case text
        case matchType
        case status
        case bidAmount
        case deleted
        case creationTime
        case modificationTime
    }
}
