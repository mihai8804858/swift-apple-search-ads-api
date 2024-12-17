import Retry

struct RetryBehavior: Sendable {
    let maxAttempts: Int
    let errorPredicate: @Sendable (Error) -> Bool
    let recovery: @Sendable (Error) async throws -> Void

    static let none = RetryBehavior(maxAttempts: 0, errorPredicate: { _ in false }, recovery: { _ in })
}

func withRetryBehavior<T>(
    _ behavior: RetryBehavior,
    operation: @Sendable () async throws -> T
) async throws -> T {
    try await withRetryBehavior(
        behavior,
        currentAttempt: 1,
        operation: operation
    )
}

private func withRetryBehavior<T>(
    _ behavior: RetryBehavior,
    currentAttempt: Int,
    operation: @Sendable () async throws -> T
) async throws -> T {
    do {
        return try await operation()
    } catch {
        if behavior.errorPredicate(error), currentAttempt < behavior.maxAttempts {
            try await behavior.recovery(error)
            return try await withRetryBehavior(
                behavior,
                currentAttempt: currentAttempt + 1,
                operation: operation
            )
        } else {
            throw error
        }
    }
}
