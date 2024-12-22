struct AdGroupReportRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let task: RequestTask

    init(campaignId: Int, request: ReportingRequest) throws {
        path = "/api/v5/reports/campaigns/\(campaignId)/adgroups"
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: request)
        ))
    }
}
