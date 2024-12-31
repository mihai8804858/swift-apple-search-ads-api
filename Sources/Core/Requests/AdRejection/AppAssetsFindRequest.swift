struct AppAssetsFindRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(adamId: Int, selector: Selector<AppAsset>?) {
        path = "/api/v5/apps/\(adamId)/assets/find"
        body = .json(selector)
    }
}
