struct TargetingKeywordsCreateRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(campaignId: Int, adGroupId: Int, keywords: [Keyword]) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/targetingkeywords/bulk"
        body = .json(keywords)
    }
}
