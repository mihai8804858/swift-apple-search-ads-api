struct ImpressionShareReportCreateRequest: RequestType {
    let path = "/api/v5/custom-reports"
    let method = HTTPMethod.post
    let body: RequestBody?

    init(request: CustomReportRequest) {
        body = .json(request)
    }
}
