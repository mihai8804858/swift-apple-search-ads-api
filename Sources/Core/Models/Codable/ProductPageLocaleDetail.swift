// The product page locale metadata on App Store Connect.
public struct ProductPageLocaleDetail: Codable, Hashable, Sendable {
    /// Your unique App Store app identifier.
    /// Use Get a Campaign or Get All Campaigns to obtain your adamId used in your campaign.
    public let adamId: Int?
    /// The app name on App Store Connect.
    public let appName: String?
    /// The device classes assigned to a custom product page on App Store Connect.
    public let deviceClasses: [DeviceClass]?
    /// The language associated with the ISO alpha-2 country code, such as US.
    public let language: String?
    /// The ISO 639-1 language code appended to the ISO 3166-1 alpha-2 country code, such as en-US.
    public let languageCode: String?
    /// A unique string to identify a product page on App Store Connect.
    public let productPageId: String?
    /// Text that appears at the top of the main description of a product page.
    public let promotionalText: String?
    /// Concise, informative text used on a product page to describe an app.
    public let shortDescription: String?
    /// A summary of an app on a product page that appears below the name of an app.
    public let subTitle: String?
    /// A map between the device and available app preview details for that device.
    public let appPreviewDeviceWithAssets: [String: AppPreviewDeviceWithAssets]?

    public init(
        adamId: Int? = nil,
        appName: String? = nil,
        deviceClasses: [DeviceClass]? = nil,
        language: String? = nil,
        languageCode: String? = nil,
        productPageId: String? = nil,
        promotionalText: String? = nil,
        shortDescription: String? = nil,
        subTitle: String? = nil,
        appPreviewDeviceWithAssets: [String: AppPreviewDeviceWithAssets]? = nil
    ) {
        self.adamId = adamId
        self.appName = appName
        self.deviceClasses = deviceClasses
        self.language = language
        self.languageCode = languageCode
        self.productPageId = productPageId
        self.promotionalText = promotionalText
        self.shortDescription = shortDescription
        self.subTitle = subTitle
        self.appPreviewDeviceWithAssets = appPreviewDeviceWithAssets
    }
}
