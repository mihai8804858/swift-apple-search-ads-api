import Foundation

/// The app assets associated with an adam ID.
public struct AppAsset: Codable, Equatable, Sendable {
    /// Your unique App Store app identifier.
    ///
    /// This field is sortable.
    public let adamId: String?
    /// Indicates the device model and corresponding display size.
    ///
    /// This field is sortable.
    public let appPreviewDevice: [String: String]?
    /// The unique identifier for an app preview or screenshot.
    /// Your `adamId` is the first numerical grouping in `assetGenId`.
    /// For example, in `1408851466;en-US;5;0;f8c9add6280c781e6f701c506be5a921`, `1408851466` is your `adamId`.
    ///
    /// This field is sortable.
    public let assetGenId: String?
    /// The type of creative asset.
    public let assetType: MediaAssetType?
    /// The resolved URL for the screenshot that you upload to App Store Connect.
    /// For a video asset, the image is the first frame.
    public let assetURL: URL?
    /// The fully resolved URL for the asset video. The field is non-null for preview assets; otherwise, it’s null.
    public let assetVideoUrl: URL?
    /// Indicates whether the asset was deleted from App Store Connect.
    ///
    /// This field is sortable.
    public let deleted: Bool?
    /// The orientation of the asset that you upload to App Store Connect.
    public let orientation: MediaAssetOrientation?
    /// The height of the asset that you upload to App Store Connect.
    ///
    /// This field is sortable.
    public let sourceHeight: Int?
    /// The width of the asset that you upload to App Store Connect.
    ///
    /// This field is sortable.
    public let sourceWidth: Int?

    public init(
        adamId: String? = nil,
        appPreviewDevice: [String: String]? = nil,
        assetGenId: String? = nil,
        assetType: MediaAssetType? = nil,
        assetURL: URL? = nil,
        assetVideoUrl: URL? = nil,
        deleted: Bool? = nil,
        orientation: MediaAssetOrientation? = nil,
        sourceHeight: Int? = nil,
        sourceWidth: Int? = nil
    ) {
        self.adamId = adamId
        self.appPreviewDevice = appPreviewDevice
        self.assetGenId = assetGenId
        self.assetType = assetType
        self.assetURL = assetURL
        self.assetVideoUrl = assetVideoUrl
        self.deleted = deleted
        self.orientation = orientation
        self.sourceHeight = sourceHeight
        self.sourceWidth = sourceWidth
    }
}
