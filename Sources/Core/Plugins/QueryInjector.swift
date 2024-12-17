import Foundation

struct QueryInjector: PluginType {
    typealias ValueProvider = @Sendable () -> String?
    typealias Predicate = @Sendable (URLRequest) -> Bool

    private let name: String
    private let replace: Bool
    private let value: ValueProvider
    private let predicate: Predicate

    init(name: String, replace: Bool, value: @escaping ValueProvider, predicate: @escaping Predicate) {
        self.name = name
        self.replace = replace
        self.value = value
        self.predicate = predicate
    }

    func prepare(request: URLRequest) async throws -> URLRequest {
        guard predicate(request), let value = value() else { return request }
        return request.adding(queries: [name: value], replace: replace)
    }
}
