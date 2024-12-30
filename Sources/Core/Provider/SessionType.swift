import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

protocol SessionType: Sendable {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

#if canImport(FoundationNetworking)
extension URLSession: SessionType {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await withCheckedThrowingContinuation { continuation in
            dataTask(with: request) { data, response, error in
                if let data, let response {
                    continuation.resume(returning: (data, response))
                } else if let error {
                    continuation.resume(throwing: error)
                }
            }.resume()
        }
    }
}
#else
extension URLSession: SessionType {}
#endif
