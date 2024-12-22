struct TargetingKeywordsUpdateRequest: RequestType {
    let path: String
    let method = HTTPMethod.put
    let body: RequestBody?

    init(campaignId: Int, adGroupId: Int, keywords: [KeywordUpdate]) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/targetingkeywords/bulk"
        body = .json(keywords)
    }
}
