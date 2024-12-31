import XCTest
import InlineSnapshotTesting
@testable import AppleSearchAds

final class AdRejectionsRequestsTests: SnapshotTestCase {
    func testAppAssetsFindRequest() async throws {
        try await assertRequest(AppAssetsFindRequest(
            adamId: 12345,
            selector: Selector(
                conditions: [
                    Condition(field: .assetType, operator: .equals, value: MediaAssetType.appPreview),
                    Condition(field: .deleted, operator: .in, values: [true, false])
                ],
                fields: [.assetGenId, .assetURL],
                orderBy: [Sorting(field: .sourceWidth, sortOrder: .ascending)],
                pagination: Pagination(limit: 20, offset: 40)
            )
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/apps/12345/assets/find
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 474
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "conditions" : [
                {
                  "field" : "assetType",
                  "operator" : "EQUALS",
                  "values" : [
                    "APP_PREVIEW"
                  ]
                },
                {
                  "field" : "deleted",
                  "operator" : "IN",
                  "values" : [
                    true,
                    false
                  ]
                }
              ],
              "fields" : [
                "assetGenId",
                "assetURL"
              ],
              "orderBy" : [
                {
                  "field" : "sourceWidth",
                  "sortOrder" : "ASCENDING"
                }
              ],
              "pagination" : {
                "limit" : 20,
                "offset" : 40
              }
            }
            """
        }
    }

    func testGetRequest() async throws {
        try await assertRequest(AdCreativeRejectionReasonsRequest(productPageReasonId: 12345)) {
            """
            GET https://api.searchads.apple.com/api/v5/product-page-reasons/12345
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testFindRequest() async throws {
        try await assertRequest(AdCreativeRejectionReasonsFindRequest(selector: Selector(
            conditions: [
                Condition(field: .reasonType, operator: .equals, value: ProductPageReason.ReasonType.rejectionReason),
                Condition(field: .reasonCode, operator: .in, values: [
                    ProductPageReason.ReasonCode.appIconGraphicOrAdultThemedContent,
                    ProductPageReason.ReasonCode.appNameGraphicOrAdultThemedContent,
                    ProductPageReason.ReasonCode.subtitleGraphicOrAdultThemedContent
                ])
            ],
            fields: [.id, .comment],
            orderBy: [Sorting(field: .languageCode, sortOrder: .ascending)],
            pagination: Pagination(limit: 20, offset: 40)
        ))) {
            """
            POST https://api.searchads.apple.com/api/v5/product-page-reasons/find
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 602
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "conditions" : [
                {
                  "field" : "reasonType",
                  "operator" : "EQUALS",
                  "values" : [
                    "REJECTION_REASON"
                  ]
                },
                {
                  "field" : "reasonCode",
                  "operator" : "IN",
                  "values" : [
                    "APP_ICON_GRAPHIC_OR_ADULT_THEMED_CONTENT",
                    "APP_NAME_GRAPHIC_OR_ADULT_THEMED_CONTENT",
                    "SUBTITLE_GRAPHIC_OR_ADULT_THEMED_CONTENT"
                  ]
                }
              ],
              "fields" : [
                "id",
                "comment"
              ],
              "orderBy" : [
                {
                  "field" : "languageCode",
                  "sortOrder" : "ASCENDING"
                }
              ],
              "pagination" : {
                "limit" : 20,
                "offset" : 40
              }
            }
            """
        }
    }
}
