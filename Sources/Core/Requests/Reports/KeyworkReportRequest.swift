struct KeywordReportRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(campaignId: Int, adGroupId: Int?, request: ReportingRequest) {
        body = .json(request)
        if let adGroupId {
            path = "/api/v5/reports/campaigns/\(campaignId)/adgroups/\(adGroupId)/keywords"
        } else {
            path = "/api/v5/reports/campaigns/\(campaignId)/keywords"
        }
    }
}
