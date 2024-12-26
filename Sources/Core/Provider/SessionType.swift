import Foundation

protocol SessionType: Sendable {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: SessionType {}
