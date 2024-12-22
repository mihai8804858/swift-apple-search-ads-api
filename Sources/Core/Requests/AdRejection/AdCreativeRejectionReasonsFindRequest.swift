struct AdCreativeRejectionReasonsFindRequest: RequestType {
    let path = "/api/v5/product-page-reasons/find"
    let method = HTTPMethod.post
    let body: RequestBody?

    init(selector: Selector?) {
        body = .json(selector)
    }
}
