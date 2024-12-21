import Foundation

/// The asset details of app preview or app screenshots.
public struct MediaAppAsset: Codable, Equatable, Sendable {
    /// The unique identifier for an app preview or screenshot.
    /// Your `adamId` is the first numerical grouping in `assetGenId`.
    /// For example, in `1408851466;en-US;5;0;f8c9add6280c781e6f701c506be5a921`, `1408851466` is your `adamId`.
    /// This field is sortable.
    public let assetGenId: String
    /// The type of creative asset.
    public let assetType: MediaAssetType
    /// The resolved URL for the screenshot.
    public let assetURL: URL
    /// The orientation of the asset that you upload to App Store Connect.
    public let orientation: MediaAssetOrientation
    /// The position in the sort order to show the asset of app preview.
    public let sortPosition: Int
    /// The height of the asset that you upload to App Store Connect.
    public let sourceHeight: Int
    /// The width of the asset that you upload to App Store Connect.
    public let sourceWidth: Int

    public init(
        assetGenId: String,
        assetType: MediaAssetType,
        assetURL: URL,
        orientation: MediaAssetOrientation,
        sortPosition: Int,
        sourceHeight: Int,
        sourceWidth: Int
    ) {
        self.assetGenId = assetGenId
        self.assetType = assetType
        self.assetURL = assetURL
        self.orientation = orientation
        self.sortPosition = sortPosition
        self.sourceHeight = sourceHeight
        self.sourceWidth = sourceWidth
    }
}
