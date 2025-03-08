import Foundation

/// The media locale detail object.
public struct AppLocaleDetails: Codable, Hashable, Sendable {
    public struct AppPreviewDeviceWithAssets: Codable, Hashable, Sendable {
        public let appPreviewDeviceFallBackDevices: [String]?
        public let screenshots: [Asset]?
        public let appPreviews: [Asset]?

        public init(
            appPreviewDeviceFallBackDevices: [String]? = nil,
            screenshots: [Asset]? = nil,
            appPreviews: [Asset]? = nil
        ) {
            self.appPreviewDeviceFallBackDevices = appPreviewDeviceFallBackDevices
            self.screenshots = screenshots
            self.appPreviews = appPreviews
        }
    }

    public struct Asset: Codable, Hashable, Sendable, Identifiable {
        public let assetGenId: String
        public let assetToken: String
        public let assetUrl: URL
        public let appPreviewDevice: String
        public let sortPosition: Int
        public let sourceHeight: Int
        public let sourceWidth: Int
        public let orientation: MediaAssetOrientation
        public let assetType: MediaAssetType
        public let checksum: String
        public let pictureUrl: URL?
        public let videoUrl: URL?
        public let assetDuplicationType: String?

        public var id: String { assetGenId }

        public init(
            assetGenId: String,
            assetToken: String,
            assetUrl: URL,
            appPreviewDevice: String,
            sortPosition: Int,
            sourceHeight: Int,
            sourceWidth: Int,
            orientation: MediaAssetOrientation,
            assetType: MediaAssetType,
            checksum: String,
            pictureUrl: URL?,
            videoUrl: URL?,
            assetDuplicationType: String?
        ) {
            self.assetGenId = assetGenId
            self.assetToken = assetToken
            self.assetUrl = assetUrl
            self.appPreviewDevice = appPreviewDevice
            self.sortPosition = sortPosition
            self.sourceHeight = sourceHeight
            self.sourceWidth = sourceWidth
            self.orientation = orientation
            self.assetType = assetType
            self.checksum = checksum
            self.pictureUrl = pictureUrl
            self.videoUrl = videoUrl
            self.assetDuplicationType = assetDuplicationType
        }
    }

    /// The name of an app.
    public let appName: String
    /// The subtitle for the app.
    public let subTitle: String
    /// An abbreviated description of the app.
    public let shortDescription: String
    /// The app language.
    public let language: String
    /// The language of the primary locale for the app.
    public let isPrimaryLocale: Bool
    /// The device display name, fallback device display names, and associated assets.
    public let appPreviewDeviceWithAssets: [String: AppPreviewDeviceWithAssets]?

    public init(
        appName: String,
        subTitle: String,
        shortDescription: String,
        language: String,
        isPrimaryLocale: Bool,
        appPreviewDeviceWithAssets: [String: AppPreviewDeviceWithAssets]? = nil
    ) {
        self.appName = appName
        self.subTitle = subTitle
        self.shortDescription = shortDescription
        self.language = language
        self.isPrimaryLocale = isPrimaryLocale
        self.appPreviewDeviceWithAssets = appPreviewDeviceWithAssets
    }
}
