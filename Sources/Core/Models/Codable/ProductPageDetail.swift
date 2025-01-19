import Foundation

/// The product page metadata.
public struct ProductPageDetail: Codable, Hashable, Sendable, Identifiable {
    /// The system state of the custom product page that indicates whether the page is visible or not.
    public enum State: String, Codable, Hashable, Sendable {
        case hidden = "HIDDEN"
        case visible = "VISIBLE"
    }

    /// A unique string to identify a product page on App Store Connect.
    public let id: String?
    /// Your unique App Store app identifier.
    /// Use Get a Campaign or Get All Campaigns to obtain your `adamId` used in your campaign.
    public let adamId: Int?
    /// The name of your custom product page on App Store Connect.
    public let name: String?
    /// The system state of the custom product page that indicates whether the page is visible or not.
    public let state: State?
    /// The deep link set up in your custom product page metadata on App Store Connect.
    ///
    /// Deep links are available on iOS 18 and later for Today tab and search results ad variations,
    /// and iPadOS 18 and later for search results ad variations.
    /// Note that deep links are not available for ads with demographic targeting (age or gender).
    ///
    /// This field is not modifiable.
    public let deepLink: URL?
    /// The date and time the object was created.
    ///
    /// This field is not modifiable.
    public let creationTime: Date?
    /// The date and time of the most recent modification of the object.
    ///
    /// This field is not modifiable.
    public let modificationTime: Date?

    public init(
        id: String? = nil,
        adamId: Int? = nil,
        name: String? = nil,
        state: State? = nil,
        deepLink: URL? = nil,
        creationTime: Date? = nil,
        modificationTime: Date? = nil
    ) {
        self.id = id
        self.adamId = adamId
        self.name = name
        self.state = state
        self.deepLink = deepLink
        self.creationTime = creationTime
        self.modificationTime = modificationTime
    }
}
