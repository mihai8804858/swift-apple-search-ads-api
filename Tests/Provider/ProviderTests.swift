import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import XCTest
@testable import AppleSearchAds

final class ProviderTests: XCTestCase {
    private struct MockModel: Equatable, Codable, Sendable {
        let intValue: Int
        let stringValue: String
        let doubleValue: Double
        let boolValue: Bool
        let arrayValue: [Int]
        let dictValue: [String: String]
    }

    private struct MockRequest: RequestType {
        let path = "/api/v1/path"
        let method = HTTPMethod.get
    }

    private final class MockPlugin: PluginType {
        nonisolated(unsafe) var preparedRequests: [URLRequest] = []

        func prepare(request: inout URLRequest) {
            preparedRequests.append(request)
        }
    }

    private let baseURL = URL(string: "https://example.com")!

    func testPrepareRequest() async throws {
        let request = MockRequest()
        let session = MockSession()
        let plugin = MockPlugin()
        let provider = Provider(
            baseURL: baseURL,
            session: session,
            plugins: [plugin],
            retryBehavior: .none,
            exponentialBackoffBehavior: .none
        )

        let httpResponse = try XCTUnwrap(HTTPURLResponse(
            url: baseURL.appendingPathComponent(request.path),
            statusCode: ResponseStatus.success.rawValue,
            httpVersion: "1.0",
            headerFields: nil
        ))
        session.dataStub = .success((Data(), httpResponse))
        _ = try await provider.requestData(from: request)

        let urlRequest = try XCTUnwrap(plugin.preparedRequests.first)
        XCTAssertEqual(urlRequest.url, baseURL.appendingPathComponent(request.path))
        XCTAssertEqual(plugin.preparedRequests.count, 1)
    }

    func testValidateStatusCode() async throws {
        let request = MockRequest()
        let session = MockSession()
        let provider = Provider(
            baseURL: baseURL,
            session: session,
            plugins: [],
            retryBehavior: .none,
            exponentialBackoffBehavior: .none
        )

        let httpResponse = try XCTUnwrap(HTTPURLResponse(
            url: baseURL.appendingPathComponent(request.path),
            statusCode: ResponseStatus.badRequest.rawValue,
            httpVersion: "1.0",
            headerFields: nil
        ))
        session.dataStub = .success((Data(), httpResponse))
        let response = await Result {
            try await provider.requestData(from: request)
        }

        let error = try XCTUnwrap(response.failure as? APIError)
        XCTAssertEqual(error, APIError.api(APIErrorResponse(error: nil, statusCode: .badRequest)))
    }

    func testRequestModel() async throws {
        let request = MockRequest()
        let session = MockSession()
        let model = MockModel(
            intValue: 123,
            stringValue: "456",
            doubleValue: 789.123,
            boolValue: true,
            arrayValue: [456, 789],
            dictValue: ["key 1": "value 1", "key 2": "value 2"]
        )
        let provider = Provider(
            baseURL: baseURL,
            session: session,
            plugins: [],
            retryBehavior: .none,
            exponentialBackoffBehavior: .none
        )

        let httpResponse = try XCTUnwrap(HTTPURLResponse(
            url: baseURL.appendingPathComponent(request.path),
            statusCode: ResponseStatus.success.rawValue,
            httpVersion: "1.0",
            headerFields: nil
        ))
        let data = try JSONEncoder.default.encode(model)
        session.dataStub = .success((data, httpResponse))
        let response: Result<Response<MockModel>, Error> = await Result {
            try await provider.requestModel(from: request)
        }

        XCTAssertEqual(try response.get(), Response(model: model, statusCode: .success))
    }

    func testRequestDataModel() async throws {
        let request = MockRequest()
        let session = MockSession()
        let model = DataResponse(data: MockModel(
            intValue: 123,
            stringValue: "456",
            doubleValue: 789.123,
            boolValue: true,
            arrayValue: [456, 789],
            dictValue: ["key 1": "value 1", "key 2": "value 2"]
        ))
        let provider = Provider(
            baseURL: baseURL,
            session: session,
            plugins: [],
            retryBehavior: .none,
            exponentialBackoffBehavior: .none
        )

        let httpResponse = try XCTUnwrap(HTTPURLResponse(
            url: baseURL.appendingPathComponent(request.path),
            statusCode: ResponseStatus.success.rawValue,
            httpVersion: "1.0",
            headerFields: nil
        ))
        let data = try JSONEncoder.default.encode(model)
        session.dataStub = .success((data, httpResponse))
        let response: Result<Response<MockModel>, Error> = await Result {
            try await provider.requestDataModel(from: request)
        }

        XCTAssertEqual(try response.get(), Response(model: model.data, statusCode: .success))
    }

    func testRequestPaginatedModel() async throws {
        let request = MockRequest()
        let session = MockSession()
        let model = Paginated(data: [
            MockModel(
                intValue: 123,
                stringValue: "456",
                doubleValue: 789.123,
                boolValue: true,
                arrayValue: [456, 789],
                dictValue: ["key 1": "value 1", "key 2": "value 2"]
            )
        ], pagination: PageDetail(
            totalResults: 10,
            startIndex: 0,
            itemsPerPage: 2
        ))
        let provider = Provider(
            baseURL: baseURL,
            session: session,
            plugins: [],
            retryBehavior: .none,
            exponentialBackoffBehavior: .none
        )

        let httpResponse = try XCTUnwrap(HTTPURLResponse(
            url: baseURL.appendingPathComponent(request.path),
            statusCode: ResponseStatus.success.rawValue,
            httpVersion: "1.0",
            headerFields: nil
        ))
        let data = try JSONEncoder.default.encode(model)
        session.dataStub = .success((data, httpResponse))
        let response: Result<Response<Paginated<MockModel>>, Error> = await Result {
            try await provider.requestPaginatedModel(from: request)
        }

        XCTAssertEqual(try response.get(), Response(model: model, statusCode: .success))
    }
}
