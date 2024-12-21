struct AdCreativeRejectionReasonsRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let task = RequestTask.plain

    init(productPageReasonId: Int) {
        path = "/api/v5/product-page-reasons/\(productPageReasonId)"
    }
}
