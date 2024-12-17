// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "swift-apple-search-ads-api",
    platforms: [
        .iOS(.v16),
        .tvOS(.v16),
        .visionOS(.v1),
        .macOS(.v13),
        .macCatalyst(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(name: "AppleSearchAds", targets: ["AppleSearchAds"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-crypto.git", from: "3.10.0"),
        .package(url: "https://github.com/fumoboy007/swift-retry.git", from: "0.2.4")
    ],
    targets: [
        .target(
            name: "AppleSearchAds",
            dependencies: [
                .product(name: "Crypto", package: "swift-crypto"),
                .product(name: "DMRetry", package: "swift-retry")
            ],
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
