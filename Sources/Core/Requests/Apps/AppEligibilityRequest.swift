struct AppEligibilityRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(adamId: Int, selector: Selector<EligibilityRecord>?) {
        path = "/api/v5/apps/\(adamId)/eligibilities/find"
        body = .json(selector)
    }
}
