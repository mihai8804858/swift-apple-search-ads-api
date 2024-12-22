struct TargetingKeywordDeleteRequest: RequestType {
    let path: String
    let method = HTTPMethod.delete

    init(campaignId: Int, adGroupId: Int, keywordId: Int) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/targetingkeywords/\(keywordId)"
    }
}
