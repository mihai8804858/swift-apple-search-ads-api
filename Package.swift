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
        .package(url: "https://github.com/apple/swift-crypto", from: "3.10.0"),
        .package(url: "https://github.com/fumoboy007/swift-retry", from: "0.2.4"),
        .package(url: "https://github.com/CreateAPI/URLQueryEncoder", from: "0.2.1"),
        .package(url: "https://github.com/pointfreeco/swift-clocks", from: "1.0.6"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.17.6"),
        .package(url: "https://github.com/Flight-School/AnyCodable", from: "0.6.7")
    ],
    targets: [
        .target(
            name: "AppleSearchAds",
            dependencies: [
                .product(name: "Crypto", package: "swift-crypto"),
                .product(name: "DMRetry", package: "swift-retry"),
                .product(name: "AnyCodable", package: "AnyCodable"),
                .product(name: "URLQueryEncoder", package: "URLQueryEncoder")
            ],
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")],
            swiftSettings: [.enableExperimentalFeature("StrictConcurrency")]
        ),
        .testTarget(
            name: "AppleSearchAdsTests",
            dependencies: [
                .target(name: "AppleSearchAds"),
                .product(name: "Clocks", package: "swift-clocks"),
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
                .product(name: "InlineSnapshotTesting", package: "swift-snapshot-testing")
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
