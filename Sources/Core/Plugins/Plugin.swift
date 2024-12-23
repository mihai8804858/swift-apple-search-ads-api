import Foundation

protocol PluginType: Sendable {
    func prepare(request: inout URLRequest) async throws
}
