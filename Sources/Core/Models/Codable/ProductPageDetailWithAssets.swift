import Foundation

/// The product page asset metadata.
public struct ProductPageDetailWithAssets: Codable, Equatable, Sendable {
    /// A unique string to identify a product page on App Store Connect.
    public let id: String?
    /// Your unique App Store app identifier.
    /// Use Get a Campaign or Get All Campaigns to obtain your `adamId` used in your campaign.
    public let adamId: Int?
    /// A unique identifier of the registered content owner.
    public let contentProviderId: Int?
    /// The name of your custom product page on App Store Connect.
    public let name: String?
    /// Indicates if the custom product page is the default on App Store Connect.
    public let isDefault: Bool?
    /// Localized metadata used on a product page with app preview.
    public let localization: [CreativeLocalizationWithAssets]?
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
        contentProviderId: Int? = nil,
        name: String? = nil,
        isDefault: Bool? = nil,
        localization: [CreativeLocalizationWithAssets]? = nil,
        creationTime: Date? = nil,
        modificationTime: Date? = nil
    ) {
        self.id = id
        self.adamId = adamId
        self.contentProviderId = contentProviderId
        self.name = name
        self.isDefault = isDefault
        self.localization = localization
        self.creationTime = creationTime
        self.modificationTime = modificationTime
    }
}
