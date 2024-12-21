struct CreativeRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let task: RequestTask

    init(creativeId: Int, includeDeletedCreativeSetAssets: Bool?) {
        path = "/api/v5/creatives/\(creativeId)"
        task = .parameterized(EncodedParameters(
            encoding: URLEncoding.queryString,
            parameters: URLParameters([
                "includeDeletedCreativeSetAssets": includeDeletedCreativeSetAssets
            ])
        ))
    }
}
