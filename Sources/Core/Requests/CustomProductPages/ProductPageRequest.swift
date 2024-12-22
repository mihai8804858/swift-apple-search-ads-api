struct ProductPageRequest: RequestType {
    let path: String
    let method = HTTPMethod.get

    init(adamId: Int, productPageId: String) {
        path = "/api/v5/apps/\(adamId)/product-pages/\(productPageId)"
    }
}
