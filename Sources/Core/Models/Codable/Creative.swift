import Foundation

/// The creative object.
public struct Creative: Codable, Equatable, Sendable {
    /// The type of creative.
    public enum Kind: String, Codable, Equatable, Sendable {
        /// You can assign only one custom product page to an adgroup.
        case customProductPage = "CUSTOM_PRODUCT_PAGE"
        /// See section 4.1 in Apple Search Ads Campaign Management API 4
        /// for additional details on Creative Sets deprecation.
        case creativeSet = "CREATIVE_SET"
        /// Default product page.
        case defaultProductPage = "DEFAULT_PRODUCT_PAGE"
    }

    /// The system state of the creative.
    public enum State: String, Codable, Equatable, Sendable {
        /// The state of the creative is valid.
        case valid = "VALID"
        /// The state of the creative is invalid.
        case invalid = "INVALID"
    }

    /// Reasons the system provides when an ad isn’t running.
    public enum StateReason: String, Codable, Equatable, Sendable {
        /// The creative asset was deleted from App Store Connect.
        case assetDeleted = "ASSET_DELETED"
        /// See section 4.1 in Apple Search Ads Campaign Management API 4 for additional details.
        case creativeSetUnsupported = "CREATIVE_SET_UNSUPPORTED"
        /// The product page was deleted from App Store Connect.
        case productPageDeleted = "PRODUCT_PAGE_DELETED"
        /// The product page is hidden on App Store Connect.
        case productPageHidden = "PRODUCT_PAGE_HIDDEN"
    }

    /// The creativeId is a unique identifier for a creative.
    public let id: Int
    /// Your unique App Store app identifier.
    ///
    /// This field is required in requests to Create a Creative.
    public let adamId: Int
    /// The identifier of the organization that owns a campaign.
    ///
    /// Your `orgId` is the same as your account in the Apple Search Ads UI.
    public let orgId: Int
    /// The name of a creative.
    ///
    /// This field is required in requests to Create a Creative.
    /// Minimum Length: 1
    /// Maximum Length: 200
    public let name: String
    /// The type of creative.
    ///
    /// This field is required in requests to Create a Creative.
    public let type: Kind
    /// The system state of the creative.
    public let state: State
    /// The detailed explanation of the system state.
    public let stateReasons: [StateReason]
    /// The date and time of the creation of the Creative object.
    public let creationTime: Date
    /// The date and time of the most recent modification of the object.
    public let modificationTime: Date

    public init(
        id: Int,
        adamId: Int,
        orgId: Int,
        name: String,
        type: Kind,
        state: State,
        stateReasons: [StateReason],
        creationTime: Date,
        modificationTime: Date
    ) {
        self.id = id
        self.adamId = adamId
        self.orgId = orgId
        self.name = name
        self.type = type
        self.state = state
        self.stateReasons = stateReasons
        self.creationTime = creationTime
        self.modificationTime = modificationTime
    }
}
