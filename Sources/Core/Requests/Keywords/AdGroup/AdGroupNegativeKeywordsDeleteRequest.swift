struct AdGroupNegativeKeywordsDeleteRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(campaignId: Int, adGroupId: Int, keywordIds: [Int]) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/negativekeywords/delete/bulk"
        body = .json(keywordIds)
    }
}
