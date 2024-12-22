struct SearchTermReportRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let task: RequestTask

    init(campaignId: Int, adGroupId: Int?, request: ReportingRequest) throws {
        if let adGroupId {
            path = "/api/v5/reports/campaigns/\(campaignId)/adgroups/\(adGroupId)/searchterms"
        } else {
            path = "/api/v5/reports/campaigns/\(campaignId)/searchterms"
        }
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: request)
        ))
    }
}
