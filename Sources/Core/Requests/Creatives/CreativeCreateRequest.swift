struct CreativeCreateRequest: RequestType {
    let path = "/api/v5/creatives"
    let method = HTTPMethod.post
    let body: RequestBody?

    init(creative: CreativeCustomProductPage) {
        body = .json(creative)
    }
}
