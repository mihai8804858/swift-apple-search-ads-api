struct ProductPagesRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let task: RequestTask

    init(adamId: Int, name: String?, state: ProductPageDetail.State?) {
        path = "/api/v5/apps/\(adamId)/product-pages"
        task = .parameterized(EncodedParameters(
            encoding: URLEncoding.queryString,
            parameters: URLParameters([
                "name": name,
                "states": state
            ])
        ))
    }
}
