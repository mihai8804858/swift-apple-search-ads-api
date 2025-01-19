import Foundation

/// The creative details of a product page.
public struct CreativeCustomProductPage: Codable, Hashable, Sendable, CodingKeysContaining, Identifiable {
    /// The creativeId is a unique identifier for a creative.
    public let id: Int?
    /// Your unique App Store app identifier.
    ///
    /// This field is required in requests to Create a Creative.
    public let adamId: Int
    /// The identifier of the organization that owns a campaign.
    ///
    /// Your `orgId` is the same as your account in the Apple Search Ads UI.
    public let orgId: Int?
    /// A unique string to identify a product page on App Store Connect.
    public let productPageId: String
    /// The name of a creative.
    ///
    /// This field is required in requests to Create a Creative.
    /// Minimum Length: 1
    /// Maximum Length: 200
    public let name: String
    /// The type of creative.
    ///
    /// This field is required in requests to Create a Creative.
    public let type: Creative.Kind
    /// The system state of the creative.
    public let state: Creative.State?
    /// The detailed explanation of the system state.
    public let stateReasons: [Creative.StateReason]?
    /// The date and time of the creation of the Creative object.
    public let creationTime: Date?
    /// The date and time of the most recent modification of the object.
    public let modificationTime: Date?

    public init(
        id: Int? = nil,
        adamId: Int,
        orgId: Int? = nil,
        productPageId: String,
        name: String,
        type: Creative.Kind,
        state: Creative.State? = nil,
        stateReasons: [Creative.StateReason]? = nil,
        creationTime: Date? = nil,
        modificationTime: Date? = nil
    ) {
        self.id = id
        self.adamId = adamId
        self.orgId = orgId
        self.productPageId = productPageId
        self.name = name
        self.type = type
        self.state = state
        self.stateReasons = stateReasons
        self.creationTime = creationTime
        self.modificationTime = modificationTime
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case adamId
        case orgId
        case productPageId
        case name
        case type
        case state
        case stateReasons
        case creationTime
        case modificationTime
    }
}
