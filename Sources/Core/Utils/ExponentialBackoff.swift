import Retry

struct ExponentialBackoffBehavior: Sendable {
    let maxAttempts: Int?
    let backoff: Backoff<ContinuousClock>
    let errorPredicate: @Sendable (Error) -> Bool

    static let none = ExponentialBackoffBehavior(
        maxAttempts: nil,
        backoff: .constant(.zero),
        errorPredicate: { _ in false }
    )

    static let onRetryableError = ExponentialBackoffBehavior(
        maxAttempts: 5,
        backoff: .default(baseDelay: .seconds(2), maxDelay: .seconds(16)),
        errorPredicate: { $0.isRetryableWithBackoff }
    )
}

func withExponentialBackoff<ReturnType>(
    _ behavior: ExponentialBackoffBehavior,
    operation: @Sendable () async throws -> ReturnType
) async throws -> ReturnType {
    try await withExponentialBackoff(
        maxAttempts: behavior.maxAttempts,
        clock: ContinuousClock(),
        backoff: behavior.backoff,
        operation: operation,
        recoverFromFailure: { behavior.errorPredicate($0) ? .retry : .throw }
    )
}

func withExponentialBackoff<ClockType: Clock, ReturnType>(
    maxAttempts: Int?,
    clock: ClockType,
    backoff: Backoff<ClockType>,
    operation: @Sendable () async throws -> ReturnType,
    recoverFromFailure: @escaping @Sendable (any Error) -> RecoveryAction<ClockType>
) async throws -> ReturnType {
    try await retry(
        maxAttempts: maxAttempts,
        clock: clock,
        backoff: backoff,
        operation: operation,
        recoverFromFailure: recoverFromFailure
    )
}
