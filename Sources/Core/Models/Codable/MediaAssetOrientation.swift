/// The orientation of the asset that you upload to App Store Connect.
public enum MediaAssetOrientation: String, Codable, Hashable, Sendable {
    case landscape = "LANDSCAPE"
    case portrait = "PORTRAIT"
    case unknown = "UNKNOWN"
}
