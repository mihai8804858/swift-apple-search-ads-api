struct CreativeCreateRequest: RequestType {
    let path = "/api/v5/creatives"
    let method = HTTPMethod.post
    let task: RequestTask

    init(creative: CreativeCustomProductPage) throws {
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: creative)
        ))
    }
}
