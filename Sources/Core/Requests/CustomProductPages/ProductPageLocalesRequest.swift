struct ProductPageLocalesRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let task: RequestTask

    init(
        adamId: Int,
        productPageId: String,
        deviceClasses: DeviceClass?,
        languages: [String]?,
        languageCodes: [String]?,
        expand: Bool?
    ) {
        path = "/api/v5/apps/\(adamId)/product-pages/\(productPageId)/locale-details"
        task = .parameterized(EncodedParameters(
            encoding: URLEncoding.queryString,
            parameters: URLParameters([
                "deviceClasses": deviceClasses?.rawValue,
                "languages": languages,
                "languageCodes": languageCodes,
                "expand": expand
            ])
        ))
    }
}
