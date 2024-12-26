import Foundation
@testable import AppleSearchAds

actor MockProvider: ProviderType {
    nonisolated(unsafe) var performedRequests: [RequestType] = []
    nonisolated(unsafe) var requestDataStub = Result<Response<Data>, Error>.success(Response(
        model: Data(),
        statusCode: .success
    ))
    func requestData<Request: RequestType>(from request: Request) async throws -> Response<Data> {
        performedRequests.append(request)
        return try requestDataStub.get()
    }
}
