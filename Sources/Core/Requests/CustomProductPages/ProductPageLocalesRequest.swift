public struct ProductPageLocalesParameters: Equatable, Encodable, Sendable {
    /// Filters by device type.
    public let deviceClasses: DeviceClass?
    /// Filters by ISO alpha-2 country code, such as `US`.
    private let languages: String?
    /// Filters by ISO 639-1 language code appended to the ISO alpha-2 country code.
    ///
    /// The languageCodes parameter can have multiple values such as `en-US`, `fr-CA`.
    private let languageCodes: String?
    /// Detailed app asset details of a device. Use `true` for expanded values in the API response.
    public let expand: Bool?

    public init(
        deviceClasses: DeviceClass? = nil,
        languages: [String]? = nil,
        languageCodes: [String]? = nil,
        expand: Bool? = nil
    ) {
        self.deviceClasses = deviceClasses
        self.languages = languages?.joined(separator: ",")
        self.languageCodes = languageCodes?.joined(separator: ",")
        self.expand = expand
    }
}

struct ProductPageLocalesRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let query: RequestQuery?

    init(adamId: Int, productPageId: String, parameters: ProductPageLocalesParameters) {
        path = "/api/v5/apps/\(adamId)/product-pages/\(productPageId)/locale-details"
        query = RequestQuery(parameters)
    }
}
