import Foundation

final class MockClock: Clock, @unchecked Sendable {
    private let realClock = ContinuousClock()
    private let lock = NSLock()

    init() {
        _now = realClock.now
    }

    var minimumResolution: Duration {
        realClock.minimumResolution
    }

    private var _now: ContinuousClock.Instant
    private(set) var now: ContinuousClock.Instant {
        get {
            lock.lock()
            defer { lock.unlock() }
            return _now
        }
        set {
            lock.lock()
            defer { lock.unlock() }
            _now = max(newValue, _now)
        }
    }

    private var _isSleepEnabled = false
    var isSleepEnabled: Bool {
        get {
            lock.lock()
            defer { lock.unlock() }
            return _isSleepEnabled
        }
        set {
            lock.lock()
            defer { lock.unlock() }
            _isSleepEnabled = newValue
        }
    }

    private var _allSleepDurations = [Duration]()
    var allSleepDurations: [Duration] {
        lock.lock()
        defer { lock.unlock() }
        return _allSleepDurations
    }

    func sleep(until deadline: Instant, tolerance: Duration?) async throws {
        recordSleepDuration(deadline: deadline)
        if isSleepEnabled {
            try await realClock.sleep(until: deadline, tolerance: tolerance)
        }
        now = deadline
    }

    private func recordSleepDuration(deadline: Instant) {
        lock.lock()
        defer { lock.unlock() }
        let duration = deadline - _now
        _allSleepDurations.append(duration)
    }
}
