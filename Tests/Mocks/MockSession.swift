import Foundation
@testable import AppleSearchAds

actor MockSession: SessionType {
    nonisolated(unsafe) var performedRequests: [URLRequest] = []
    nonisolated(unsafe) var dataStub = Result<(Data, URLResponse), Error>.success((Data(), URLResponse()))
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        performedRequests.append(request)
        return try dataStub.get()
    }
}
