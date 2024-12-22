public struct ProductPagesParameters: Equatable, Encodable, Sendable {
    /// Filters by name field. For example, the name of your custom product page on App Store Connect.
    public let name: String?
    /// Filters by state, which indicates whether the product page is visible or not.
    public let state: ProductPageDetail.State?

    public init(name: String? = nil, state: ProductPageDetail.State? = nil) {
        self.name = name
        self.state = state
    }
}

struct ProductPagesRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let query: RequestQuery?

    init(adamId: Int, parameters: ProductPagesParameters) {
        path = "/api/v5/apps/\(adamId)/product-pages"
        query = RequestQuery(parameters)
    }
}
