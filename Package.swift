// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "swift-apple-search-ads-api",
    platforms: [
        .iOS(.v15),
        .tvOS(.v15),
        .visionOS(.v1),
        .macOS(.v12),
        .macCatalyst(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(name: "AppleSearchAds", targets: ["AppleSearchAds"])
    ],
    targets: [
        .target(
            name: "AppleSearchAds",
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")],
            swiftSettings: [.enableExperimentalFeature("StrictConcurrency")]
        ),
        .testTarget(
            name: "AppleSearchAdsTests",
            dependencies: [.target(name: "AppleSearchAds")]
        )
    ],
    swiftLanguageModes: [.v6]
)
