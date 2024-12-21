struct CreativesFindRequest: RequestType {
    let path = "/api/v5/creatives/find"
    let method = HTTPMethod.post
    let task: RequestTask

    init(selector: Selector?) throws {
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: selector)
        ))
    }
}
