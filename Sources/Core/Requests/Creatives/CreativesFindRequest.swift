struct CreativesFindRequest: RequestType {
    let path = "/api/v5/creatives/find"
    let method = HTTPMethod.post
    let body: RequestBody?

    init(selector: Selector?) {
        body = .json(selector)
    }
}
