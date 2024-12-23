import XCTest
import InlineSnapshotTesting
@testable import AppleSearchAds

final class GeolocationsRequestsTests: SnapshotTestCase {
    func testListRequest() async throws {
        try await assertRequest(GeolocationsListRequest(
            requests: [
                GeolocationRequest(id: "req-1", entity: .country),
                GeolocationRequest(id: "req-2", entity: .adminArea),
                GeolocationRequest(id: "req-3", entity: .locality)
            ],
            pagination: Pagination(limit: 20, offset: 40)
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/search/geo?limit=20&offset=40
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345

            [
              {
                "entity" : "Country",
                "id" : "req-1"
              },
              {
                "entity" : "AdminArea",
                "id" : "req-2"
              },
              {
                "entity" : "Locality",
                "id" : "req-3"
              }
            ]
            """
        }
    }

    func testSearchRequest() async throws {
        try await assertRequest(GeolocationsSearchRequest(parameters: GeolocationsSearchParameters(
            query: "San Fran",
            countryCode: "US",
            entity: .locality,
            pagination: Pagination(limit: 20, offset: 40)
        ))) {
            """
            GET https://api.searchads.apple.com/api/v5/search/geo?countryCode=US&entity=Locality&limit=20&offset=40&query=San%20Fran
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345
            """
        }
    }
}
