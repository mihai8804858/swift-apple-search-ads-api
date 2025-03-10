/// The app asset details of a device.
public struct MediaAppAssetsDetail: Codable, Hashable, Sendable {
    /// Devices that don’t have uploaded assets use fallback device mapping.
    public let appPreviewDeviceFallBackDevices: [String]?
    /// Still images of video assets to use for app previews.
    public let appPreviews: [MediaAppVideoAsset]?
    /// Standard images of your app to use for app previews.
    public let screenshots: [MediaAppAsset]?

    public init(
        appPreviewDeviceFallBackDevices: [String]? = nil,
        appPreviews: [MediaAppVideoAsset]? = nil,
        screenshots: [MediaAppAsset]? = nil
    ) {
        self.appPreviewDeviceFallBackDevices = appPreviewDeviceFallBackDevices
        self.appPreviews = appPreviews
        self.screenshots = screenshots
    }
}
