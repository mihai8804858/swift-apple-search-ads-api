struct AdReportRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let task: RequestTask

    init(campaignId: Int, request: ReportingRequest) throws {
        path = "/api/v5/reports/campaigns/\(campaignId)/ads"
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: request)
        ))
    }
}
