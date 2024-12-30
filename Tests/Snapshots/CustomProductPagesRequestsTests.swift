import XCTest
import InlineSnapshotTesting
@testable import AppleSearchAds

final class CustomProductPagesRequestsTests: SnapshotTestCase {
    func testAppPreviewDeviceSizesRequest() async throws {
        try await assertRequest(AppPreviewDeviceSizesRequest()) {
            """
            GET https://api.searchads.apple.com/api/v5/creativeappmappings/devices
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testProductPageLocalesRequest() async throws {
        try await assertRequest(ProductPageLocalesRequest(
            adamId: 123,
            productPageId: "page-id",
            parameters: ProductPageLocalesParameters(
                deviceClasses: .iPhone,
                languages: ["US", "GB"],
                languageCodes: ["en-US", "en-GB"],
                expand: true
            )
        )) {
            """
            GET https://api.searchads.apple.com/api/v5/apps/123/product-pages/page-id/locale-details?deviceClasses=IPHONE&expand=true&languageCodes=en-US,en-GB&languages=US,GB
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testSupportedCountriesOrRegionsRequest() async throws {
        try await assertRequest(SupportedCountriesOrRegionsRequest(
            parameters: SupportedCountriesOrRegionsParameters(countriesOrRegions: ["US", "GB"])
        )) {
            """
            GET https://api.searchads.apple.com/api/v5/countries-or-regions?countriesOrRegions=US,GB
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testProductPageRequest() async throws {
        try await assertRequest(ProductPageRequest(adamId: 123, productPageId: "page-id")) {
            """
            GET https://api.searchads.apple.com/api/v5/apps/123/product-pages/page-id
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testProductPagesRequest() async throws {
        try await assertRequest(ProductPagesRequest(
            adamId: 123,
            parameters: ProductPagesParameters(name: "Page Name", state: .visible)
        )) {
            """
            GET https://api.searchads.apple.com/api/v5/apps/123/product-pages?name=Page%20Name&state=VISIBLE
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }
}
