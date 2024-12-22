struct AdGroupReportRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(campaignId: Int, request: ReportingRequest) {
        path = "/api/v5/reports/campaigns/\(campaignId)/adgroups"
        body = .json(request)
    }
}
