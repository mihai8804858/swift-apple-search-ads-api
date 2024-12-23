public struct ProductPageLocalesParameters: Equatable, Encodable, Sendable {
    private let languages: String?
    private let languageCodes: String?

    /// Filters by device type.
    public let deviceClasses: DeviceClass?
    /// Detailed app asset details of a device. Use `true` for expanded values in the API response.
    public let expand: Bool?
    /// Filters by ISO alpha-2 country code, such as `US`.
    public var languagesList: [String]? {
        languages?.split { $0 == "," }.map(String.init)
    }
    /// Filters by ISO 639-1 language code appended to the ISO alpha-2 country code.
    ///
    /// The languageCodes parameter can have multiple values such as `en-US`, `fr-CA`.
    public var languageCodesList: [String]? {
        languageCodes?.split { $0 == "," }.map(String.init)
    }

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
