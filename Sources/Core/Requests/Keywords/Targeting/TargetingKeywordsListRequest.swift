struct TargetingKeywordsListRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let query: RequestQuery?

    init(campaignId: Int, adGroupId: Int, pagination: Pagination?) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/targetingkeywords"
        query = RequestQuery(pagination)
    }
}
