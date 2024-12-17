import Retry

func withExponentialBackoff<T>(operation: @Sendable () async throws -> T) async throws -> T {
    try await retry(
        maxAttempts: 5,
        backoff: .default(baseDelay: .seconds(2), maxDelay: .seconds(16)),
        operation: operation,
        recoverFromFailure: { $0.isRetryableWithBackoff ? .retry : .throw }
    )
}
