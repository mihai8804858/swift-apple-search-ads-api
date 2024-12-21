import Foundation

/// The app asset details of a device.
public struct MediaAppPreviewOrScreenshotsDetail: Codable, Equatable, Sendable {
    /// The display name of the device previewing the app.
    /// See Get App Preview Device Sizes for information about how devices map in the API.
    public let deviceDisplayName: String
    /// The device mappings for all the devices that use assets.
    /// Devices that don’t have uploaded assets use the fallback device mapping.
    public let fallBackDevicesDisplayNames: [String: String]
    /// Standard images of your app to use for app previews.
    public let screenshots: [MediaAppPreviewOrScreenshots]
    /// Still images of video assets to use for app previews.
    public let appPreviews: [MediaAppPreviewOrScreenshots]

    public init(
        deviceDisplayName: String,
        fallBackDevicesDisplayNames: [String: String],
        screenshots: [MediaAppPreviewOrScreenshots],
        appPreviews: [MediaAppPreviewOrScreenshots]
    ) {
        self.deviceDisplayName = deviceDisplayName
        self.fallBackDevicesDisplayNames = fallBackDevicesDisplayNames
        self.screenshots = screenshots
        self.appPreviews = appPreviews
    }
}
