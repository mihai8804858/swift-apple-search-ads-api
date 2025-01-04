import XCTest
@testable import AppleSearchAds

final class ErrorTests: XCTestCase {
    func testConnectionLost() throws {
        let errors: [Error] = [
            URLError(.networkConnectionLost),
            NSError(domain: NSURLErrorDomain, code: NSURLErrorNetworkConnectionLost)
        ]
        errors.forEach { XCTAssert($0.isConnectionLost) }
    }

    func testNotConnectedToInternet() throws {
        let errors: [Error] = [
            URLError(.notConnectedToInternet),
            NSError(domain: NSURLErrorDomain, code: NSURLErrorNotConnectedToInternet)
        ]
        errors.forEach { XCTAssert($0.isNotConnectedToInternet) }
    }

    func testUnauthorized() throws {
        let error = APIError(response: Response(model: Data(), statusCode: 401))
        XCTAssert(error.isUnauthorized)
    }

    func testForbidden() throws {
        let error = APIError(response: Response(model: Data(), statusCode: 403))
        XCTAssert(error.isForbidden)
    }

    func testTooManyRequests() throws {
        let error = APIError(response: Response(model: Data(), statusCode: 429))
        XCTAssert(error.isTooManyRequests)
    }

    func testRetryable() throws {
        XCTAssert(URLError(.networkConnectionLost).isRetryable)
        XCTAssertFalse(URLError(.notConnectedToInternet).isRetryable)
    }

    func testRetryableWithBackoff() throws {
        let badRequest = APIError(response: Response(model: Data(), statusCode: 400))
        let tooManyRequests = APIError(response: Response(model: Data(), statusCode: 429))
        let serverError = APIError(response: Response(model: Data(), statusCode: 500))
        XCTAssert(tooManyRequests.isRetryableWithBackoff)
        XCTAssert(serverError.isRetryableWithBackoff)
        XCTAssertFalse(badRequest.isRetryableWithBackoff)
    }

    func testDecodeErrorResponse() throws {
        let response = Response(model: Data("""
        {
            "error": {
                "errors": [
                    {
                        "field": "error field",
                        "message": "error message",
                        "messageCode": "ERROR-CODE-1"
                    },
                    {
                        "field": null,
                        "message": null,
                        "messageCode": null
                    }
                ]
            }
        }
        """.utf8), statusCode: 400)
        let error = APIError(response: response)
        XCTAssertEqual(error, APIError.api(APIErrorResponse(
            error: ErrorResponse(errors: [
                ErrorResponse.Item(field: "error field", message: "error message", messageCode: "ERROR-CODE-1"),
                ErrorResponse.Item(field: nil, message: nil, messageCode: nil)
            ]),
            statusCode: response.statusCode
        )))
    }
}
