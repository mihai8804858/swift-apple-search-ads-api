import Foundation

/// Negative keyword parameters to use in requests and responses.
public struct NegativeKeyword: Codable, Hashable, Sendable, CodingKeysContaining, Identifiable {
    /// A unique identifier for the negative keyword.
    public let id: Int?
    /// The unique identifier of the campaign that the negative keywords belong to.
    public let campaignId: Int?
    /// The unique identifier of the ad group that the negative keywords belong to.
    /// For campaign negative keyword endpoints, the value is null.
    public let adGroupId: Int?
    /// The word or phrase to negate in App Store user searches from showing your ad.
    public let text: String
    /// The user-controlled status to enable or pause the keyword.
    public let status: KeywordStatus?
    /// An automated keyword and bidding strategy.
    public let matchType: KeywordMatchType
    /// An indicator of whether the negative keyword is soft-deleted.
    public let deleted: Bool?
    /// The date and time of the most recent modification of the object.
    public let modificationTime: Date?

    public init(
        id: Int? = nil,
        campaignId: Int? = nil,
        adGroupId: Int? = nil,
        text: String,
        matchType: KeywordMatchType,
        status: KeywordStatus? = nil,
        deleted: Bool? = nil,
        modificationTime: Date? = nil
    ) {
        self.id = id
        self.campaignId = campaignId
        self.adGroupId = adGroupId
        self.text = text
        self.matchType = matchType
        self.status = status
        self.deleted = deleted
        self.modificationTime = modificationTime
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case campaignId
        case adGroupId
        case text
        case matchType
        case status
        case deleted
        case modificationTime
    }
}
