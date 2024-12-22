struct AdCreativeRejectionReasonsRequest: RequestType {
    let path: String
    let method = HTTPMethod.get

    init(productPageReasonId: Int) {
        path = "/api/v5/product-page-reasons/\(productPageReasonId)"
    }
}
