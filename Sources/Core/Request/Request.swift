protocol RequestType: Sendable {
    var path: String { get }
    var method: HTTPMethod { get }
    var body: RequestBody? { get }
    var query: RequestQuery? { get }
    var headers: [String: String]? { get }
}

extension RequestType {
    var body: RequestBody? { nil }
    var query: RequestQuery? { nil }
    var headers: [String: String]? { nil }
}
