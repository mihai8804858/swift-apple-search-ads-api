// The app preview device assets.
public struct AppPreviewDeviceWithAssets: Codable, Equatable, Sendable {
    /// The device that’s available for the asset, corresponding to the display size.
    /// See Get App Preview Device Sizes for device mapping in the API.
    public let appPreviewDevice: String
    /// The asset details of the app preview or app screenshots.
    public let mediaAppPreviewOrScreenshotsDetail: MediaAppAssetsDetail

    public init(
        appPreviewDevice: String,
        mediaAppPreviewOrScreenshotsDetail: MediaAppAssetsDetail
    ) {
        self.appPreviewDevice = appPreviewDevice
        self.mediaAppPreviewOrScreenshotsDetail = mediaAppPreviewOrScreenshotsDetail
    }
}
