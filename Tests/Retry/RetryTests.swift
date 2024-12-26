import XCTest
@testable import AppleSearchAds

final class RetryTests: XCTestCase {
    private struct MockError: Swift.Error, Equatable {
        let message: String
    }

    func testRetrySuccess() async throws {
        nonisolated(unsafe) var operationCount = 0
        nonisolated(unsafe) var recoveryCount = 0
        let behavior = RetryBehavior(
            maxAttempts: 3,
            errorPredicate: { _ in true },
            recovery: { _ in recoveryCount += 1 }
        )

        let result = await Result {
            try await withRetryBehavior(behavior) {
                operationCount += 1
                return "success"
            }
        }

        XCTAssertEqual(try result.get(), "success")
        XCTAssertEqual(operationCount, 1)
        XCTAssertEqual(recoveryCount, 0)
    }

    func testRetryFailure() async throws {
        nonisolated(unsafe) var operationCount = 0
        nonisolated(unsafe) var recoveryCount = 0
        let behavior = RetryBehavior(
            maxAttempts: 3,
            errorPredicate: { _ in true },
            recovery: { _ in recoveryCount += 1 }
        )

        let result = await Result {
            try await withRetryBehavior(behavior) {
                operationCount += 1
                throw MockError(message: "error")
            }
        }

        let error = try XCTUnwrap(result.failure as? MockError)
        XCTAssertEqual(error, MockError(message: "error"))
        XCTAssertEqual(operationCount, 3)
        XCTAssertEqual(recoveryCount, 2)
    }

    func testRetryRecovery() async throws {
        nonisolated(unsafe) var isFirstOperation = true
        nonisolated(unsafe) var operationCount = 0
        nonisolated(unsafe) var recoveryCount = 0
        let behavior = RetryBehavior(
            maxAttempts: 3,
            errorPredicate: { _ in true },
            recovery: { _ in recoveryCount += 1 }
        )

        let result = await Result {
            try await withRetryBehavior(behavior) {
                defer {
                    isFirstOperation = false
                    operationCount += 1
                }
                if isFirstOperation {
                    throw MockError(message: "error")
                } else {
                    return "success"
                }
            }
        }

        XCTAssertEqual(try result.get(), "success")
        XCTAssertEqual(operationCount, 2)
        XCTAssertEqual(recoveryCount, 1)
    }
}

extension Result where Failure == Swift.Error {
    init(catching body: () async throws -> Success) async {
        do {
            self = .success(try await body())
        } catch {
            self = .failure(error)
        }
    }
}

extension Result {
    var failure: Failure? {
        switch self {
        case .success: nil
        case .failure(let error): error
        }
    }
}
