/// The type of creative asset.
public enum MediaAssetType: String, Codable, Hashable, Sendable {
    /// Video still image of video assets that you upload to App Store Connect.
    case appPreview = "APP_PREVIEW"
    /// Standard image of the app that you upload to App Store Connect.
    case screenshot = "SCREENSHOT"
}
