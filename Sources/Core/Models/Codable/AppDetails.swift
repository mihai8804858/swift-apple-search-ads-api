import Foundation

/// The media detail object.
public struct AppDetails: Codable, Hashable, Sendable, Identifiable {
    /// A unique ID.
    public let id: String
    /// Your unique App Store app identifier.
    public let adamId: Int
    /// The name of an app.
    public let appName: String
    /// The name of the app author.
    public let artistName: String
    /// Countries or regions where the app is available.
    public let availableStorefronts: [String]
    /// Device classes supported.
    public let deviceClasses: [DeviceClass]
    /// The URL of the image asset.
    public let iconPictureUrl: URL
    /// Indicates if the app is a pre-order.
    public let isPreOrder: Bool
    /// The genre of the app.
    public let primaryGenre: String
    /// The secondary genre of the app.
    public let secondaryGenre: String
    /// The primary language of the app.
    public let primaryLanguage: String

    public init(
        id: String,
        adamId: Int,
        appName: String,
        artistName: String,
        availableStorefronts: [String],
        deviceClasses: [DeviceClass],
        iconPictureUrl: URL,
        isPreOrder: Bool,
        primaryGenre: String,
        secondaryGenre: String,
        primaryLanguage: String
    ) {
        self.id = id
        self.adamId = adamId
        self.appName = appName
        self.artistName = artistName
        self.availableStorefronts = availableStorefronts
        self.deviceClasses = deviceClasses
        self.iconPictureUrl = iconPictureUrl
        self.isPreOrder = isPreOrder
        self.primaryGenre = primaryGenre
        self.secondaryGenre = secondaryGenre
        self.primaryLanguage = primaryLanguage
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.adamId = try container.decode(Int.self, forKey: .adamId)
        self.appName = try container.decode(String.self, forKey: .appName)
        self.artistName = try container.decode(String.self, forKey: .artistName)
        self.availableStorefronts = try container.decode([String].self, forKey: .availableStorefronts)
        self.deviceClasses = try container.decode([DeviceClass].self, forKey: .deviceClasses)
        self.iconPictureUrl = try container.decode(URL.self, forKey: .iconPictureUrl)
        self.primaryGenre = try container.decode(String.self, forKey: .primaryGenre)
        self.secondaryGenre = try container.decode(String.self, forKey: .secondaryGenre)
        self.primaryLanguage = try container.decode(String.self, forKey: .primaryLanguage)
        self.isPreOrder = try {
            if let isPreOrder = try? container.decode(Bool.self, forKey: .isPreOrder) {
                return isPreOrder
            } else if let isPreOrderString = try? container.decode(String.self, forKey: .isPreOrder),
                      let isPreOrder = Bool(isPreOrderString) {
                return isPreOrder
            } else {
                throw DecodingError.dataCorrupted(DecodingError.Context(
                    codingPath: [CodingKeys.isPreOrder],
                    debugDescription: "Data corrupted"
                ))
            }
        }()
    }
}
