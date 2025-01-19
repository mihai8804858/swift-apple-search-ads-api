import Foundation

/// The app preview or screenshot asset detail.
public struct MediaAppVideoAsset: Codable, Hashable, Sendable, Identifiable {
    /// The unique identifier for an app preview or screenshot.
    /// Your `adamId` is the first numerical grouping in `assetGenId`.
    /// For example, in `1408851466;en-US;5;0;f8c9add6280c781e6f701c506be5a921`, `1408851466` is your `adamId`.
    /// This field is sortable.
    public let assetGenId: String?
    /// The type of creative asset.
    public let assetType: MediaAssetType?
    /// The resolved URL for the screenshot. For a video asset, the image is the first frame.
    public let assetURL: URL?
    /// The fully resolved URL for the asset video.
    /// The field is non-null for preview assets; otherwise, it’s null.
    public let assetVideoURL: URL?
    /// The orientation of the asset that you upload to App Store Connect.
    public let orientation: MediaAssetOrientation?
    /// The position in the sort order to show the asset of app preview.
    public let sortPosition: Int?
    /// The height of the asset that you upload to App Store Connect.
    public let sourceHeight: Int?
    /// The width of the asset that you upload to App Store Connect.
    public let sourceWidth: Int?

    public var id: String? { assetGenId }

    public init(
        assetGenId: String? = nil,
        assetType: MediaAssetType? = nil,
        assetURL: URL? = nil,
        assetVideoURL: URL? = nil,
        orientation: MediaAssetOrientation? = nil,
        sortPosition: Int? = nil,
        sourceHeight: Int? = nil,
        sourceWidth: Int? = nil
    ) {
        self.assetGenId = assetGenId
        self.assetType = assetType
        self.assetURL = assetURL
        self.assetVideoURL = assetVideoURL
        self.orientation = orientation
        self.sortPosition = sortPosition
        self.sourceHeight = sourceHeight
        self.sourceWidth = sourceWidth
    }
}
