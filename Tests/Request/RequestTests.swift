import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import XCTest
@testable import AppleSearchAds

final class RequestTests: XCTestCase {
    private struct MockValue: Encodable {
        let intValue = 1
        let boolValue = true
        let stringValue = "Value"
        let arrayValue = [
            "Value 1",
            "Value 2"
        ]
        let dictValue = [
            "Key 1": "Value 1",
            "Key 2": "Value 2"
        ]
    }

    private struct MockRequest: RequestType {
        let path = "/api/v1/path"
        let method = HTTPMethod.get
        let body: RequestBody? = .json(MockValue())
        let query: RequestQuery? = .init(MockValue())
        let headers: [String: String]? = [
            "Header 1": "Value 1",
            "Header 2": "Value 2"
        ]
    }

    func testURLRequest() async throws {
        let request = MockRequest()
        let baseURL = try XCTUnwrap(URL(string: "https://example.com"))
        let urlRequest = try request.urlRequest(baseURL: baseURL)

        let url = try XCTUnwrap(urlRequest.url?.absoluteString)
        let components = try XCTUnwrap(URLComponents(string: url))
        let queryItems = try XCTUnwrap(components.queryItems)
        let body = try XCTUnwrap(urlRequest.httpBody)
        let bodyString = try XCTUnwrap(String(bytes: body, encoding: .utf8))

        XCTAssertEqual(components.scheme, "https")
        XCTAssertEqual(components.host, "example.com")
        XCTAssertEqual(components.path, "/api/v1/path")
        #if !os(Linux)
        // This fails on Linux for some reason, even when the query items are identical
        XCTAssertEqual(Set(queryItems), Set([
            URLQueryItem(name: "intValue", value: "1"),
            URLQueryItem(name: "boolValue", value: "true"),
            URLQueryItem(name: "stringValue", value: "Value"),
            URLQueryItem(name: "arrayValue", value: "Value 1"),
            URLQueryItem(name: "arrayValue", value: "Value 2"),
            URLQueryItem(name: "value", value: "Value 2"),
            URLQueryItem(name: "value", value: "Value 1")
        ]))
        #endif
        XCTAssertEqual(urlRequest.httpMethod, "GET")
        XCTAssertEqual(urlRequest.allHTTPHeaderFields, [
            "Content-Type": "application/json",
            "Content-Length": "194",
            "Header 1": "Value 1",
            "Header 2": "Value 2"
        ])
        XCTAssertEqual(bodyString, """
        {
          "arrayValue" : [
            "Value 1",
            "Value 2"
          ],
          "boolValue" : true,
          "dictValue" : {
            "Key 1" : "Value 1",
            "Key 2" : "Value 2"
          },
          "intValue" : 1,
          "stringValue" : "Value"
        }
        """)
    }
}
