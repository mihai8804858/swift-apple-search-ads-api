struct AdCreativeRejectionReasonsFindRequest: RequestType {
    let path = "/api/v5/product-page-reasons/find"
    let method = HTTPMethod.post
    let task: RequestTask

    init(selector: Selector?) throws {
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: selector)
        ))
    }
}
