import Foundation

/// The localized creative metadata with app preview.
public struct CreativeLocalizationWithAssets: Codable, Hashable, Sendable {
    /// The app name on App Store Connect.
    public let appName: String?
    /// The device classes assigned to a custom product page.
    public let deviceClasses: DeviceClass?
    /// The language associated with the ISO alpha-2 country code, such as US.
    public let language: String?
    /// The ISO 639-1 language code appended to the ISO alpha-2 country code, such as en-US.
    public let languageCode: String?
    /// Text that appears at the top of the main description of a product page.
    public let promotionalText: String?
    /// Concise, informative text to describe an app on a product page.
    public let shortDescription: String?
    /// A summary of an app that appears below the name of an app on a product page.
    public let subTitle: String?
    /// The map of available app preview details for a device.
    public let appPreviewDeviceWithAssets: [String: MediaAppPreviewOrScreenshotsDetail]?

    public init(
        appName: String? = nil,
        deviceClasses: DeviceClass? = nil,
        language: String? = nil,
        languageCode: String? = nil,
        promotionalText: String? = nil,
        shortDescription: String? = nil,
        subTitle: String? = nil,
        appPreviewDeviceWithAssets: [String: MediaAppPreviewOrScreenshotsDetail]? = nil
    ) {
        self.appName = appName
        self.deviceClasses = deviceClasses
        self.language = language
        self.languageCode = languageCode
        self.promotionalText = promotionalText
        self.shortDescription = shortDescription
        self.subTitle = subTitle
        self.appPreviewDeviceWithAssets = appPreviewDeviceWithAssets
    }
}
