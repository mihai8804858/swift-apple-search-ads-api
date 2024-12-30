import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

protocol PluginType: Sendable {
    func prepare(request: inout URLRequest) async throws
}
