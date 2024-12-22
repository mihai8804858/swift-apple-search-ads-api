struct CampaignReportRequest: RequestType {
    let path = "/api/v5/reports/campaigns"
    let method = HTTPMethod.post
    let task: RequestTask

    init(request: ReportingRequest) throws {
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: request)
        ))
    }
}
