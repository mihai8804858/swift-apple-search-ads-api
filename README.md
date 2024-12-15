# AppleSearchAds

`AppleSearchAds` is a framework that enables working with the [Apple Search Ads API](https://developer.apple.com/documentation/apple_search_ads) from Apple.

[![CI](https://github.com/mihai8804858/swift-apple-search-ads-api/actions/workflows/ci.yml/badge.svg)](https://github.com/mihai8804858/swift-apple-search-ads-api/actions/workflows/ci.yml)

## Installation

You can add `swift-apple-search-ads-api` to an Xcode project by adding it to your project as a package.

> https://github.com/mihai8804858/swift-apple-search-ads-api

If you want to use `swift-apple-search-ads-api` in a [SwiftPM](https://swift.org/package-manager/) project, it's as simple as adding it to your `Package.swift`:

``` swift
dependencies: [
    .package(url: "https://github.com/mihai8804858/swift-apple-search-ads-api", branch: "main")
]
```

And then adding the product to any target that needs access to the library:

```swift
.product(name: "AppleSearchAds", package: "swift-apple-search-ads-api")
```

## Quick Start

Just import `AppleSearchAds` in your project to access the API:

```swift
import AppleSearchAds
```

## License

This library is released under the MIT license. See [LICENSE](LICENSE) for details.
