struct ImpressionShareReportCreateRequest: RequestType {
    let path = "/api/v5/custom-reports"
    let method = HTTPMethod.post
    let task: RequestTask

    init(request: CustomReportRequest) throws {
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: request)
        ))
    }
}
