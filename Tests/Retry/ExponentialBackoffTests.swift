import XCTest
import Retry
@testable import AppleSearchAds

final class ExponentialBackoffTests: XCTestCase {
    func testRetrySuccess() async throws {
        nonisolated(unsafe) var operationCount = 0
        let clock = MockClock()
        let backoff = Backoff<MockClock>.default(baseDelay: .seconds(2), maxDelay: .seconds(16))

        let result = await Result {
            try await withExponentialBackoff(maxAttempts: 5, clock: clock, backoff: backoff) {
                operationCount += 1
                return "success"
            } recoverFromFailure: { error in
                error.isRetryableWithBackoff ? .retry : .throw
            }
        }

        XCTAssertEqual(try result.get(), "success")
        XCTAssertEqual(operationCount, 1)
        XCTAssertEqual(clock.allSleepDurations, [])
    }

    func testRetryFailure() async throws {
        nonisolated(unsafe) var operationCount = 0
        let clock = MockClock()
        let backoff = Backoff<MockClock>.default(baseDelay: .seconds(2), maxDelay: .seconds(16))
        let error = APIError.api(.init(error: nil, statusCode: 429))

        let result = await Result {
            try await withExponentialBackoff(maxAttempts: 5, clock: clock, backoff: backoff) {
                operationCount += 1
                throw error
            } recoverFromFailure: { error in
                error.isRetryableWithBackoff ? .retry : .throw
            }
        }

        let resultError = try XCTUnwrap(result.failure as? APIError)
        XCTAssertEqual(resultError, error)
        XCTAssertEqual(operationCount, 5)
        XCTAssertEqual(clock.allSleepDurations.count, 4)
    }

    func testRetryRecovery() async throws {
        nonisolated(unsafe) var operationCount = 0
        let clock = MockClock()
        let backoff = Backoff<MockClock>.default(baseDelay: .seconds(2), maxDelay: .seconds(16))
        let error = APIError.api(.init(error: nil, statusCode: 429))

        let result = await Result {
            try await withExponentialBackoff(maxAttempts: 5, clock: clock, backoff: backoff) {
                defer { operationCount += 1 }
                if operationCount < 2 {
                    throw error
                } else {
                    return "success"
                }
            } recoverFromFailure: { error in
                error.isRetryableWithBackoff ? .retry : .throw
            }
        }

        XCTAssertEqual(try result.get(), "success")
        XCTAssertEqual(operationCount, 3)
        XCTAssertEqual(clock.allSleepDurations.count, 2)
    }
}
