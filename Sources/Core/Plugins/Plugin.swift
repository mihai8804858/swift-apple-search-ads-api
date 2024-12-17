import Foundation

protocol PluginType: Sendable {
    func prepare(request: URLRequest) async throws -> URLRequest
}
