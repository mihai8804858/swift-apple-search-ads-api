struct AppAssetsFindRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let task: RequestTask

    init(adamId: Int, selector: Selector?) throws {
        path = "/api/v5/apps/\(adamId)/assets/find"
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: selector)
        ))
    }
}
