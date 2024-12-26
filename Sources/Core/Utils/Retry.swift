import Retry

struct RetryBehavior: Sendable {
    let maxAttempts: Int
    let errorPredicate: @Sendable (Error) -> Bool
    let recovery: @Sendable (Error) async throws -> Void

    static let none = RetryBehavior(
        maxAttempts: 0,
        errorPredicate: { _ in false },
        recovery: { _ in }
    )

    static let onConnectionLost = RetryBehavior(
        maxAttempts: 3,
        errorPredicate: \.isConnectionLost,
        recovery: { _ in }
    )

    static func onUnauthorized(_ store: AccessTokenStore) -> RetryBehavior {
        RetryBehavior(
            maxAttempts: 3,
            errorPredicate: { $0.isUnauthorized || $0.isConnectionLost },
            recovery: { error in
                if error.isUnauthorized {
                    try await store.refreshToken()
                }
            }
        )
    }
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
