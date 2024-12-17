import Foundation

public struct APIResponse<T: Sendable>: CustomDebugStringConvertible, Sendable {
    public let model: T
    public let statusCode: Int

    public var debugDescription: String {
        """
        Status code: \(statusCode)
        Model: \(model)
        """
    }

    public init(model: T, statusCode: Int) {
        self.model = model
        self.statusCode = statusCode
    }

    func map<U>(_ transform: (T) -> U) -> APIResponse<U> {
        APIResponse<U>(model: transform(model), statusCode: statusCode)
    }
}

extension APIResponse: Equatable where T: Equatable {}
