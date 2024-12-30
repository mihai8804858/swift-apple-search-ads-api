import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
@testable import AppleSearchAds

actor MockSession: SessionType {
    nonisolated(unsafe) var performedRequests: [URLRequest] = []
    nonisolated(unsafe) var dataStub: Result<(Data, URLResponse), Error>?
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        performedRequests.append(request)
        guard let dataStub else { fatalError("MockSession hsa not been stubbed") }
        return try dataStub.get()
    }
}
