public struct GeolocationsSearchParameters: Equatable, Encodable, Sendable {
    /// The query search pattern uses a prefix-matching algorithm.
    public let query: String?
    /// The country or region to serve ads in.
    ///
    /// Campaigns that serve multiple countries or regions can’t use geotargeting.
    /// The query uses a countrycode value in an ISO alpha-2 country code format.
    public let countryCode: String?
    /// The country, admin area, or locality locations available for targeting.
    public let entity: GeolocationEntity?
    /// The number of items to return per request.
    ///
    /// For most objects, the default is 20 and the maximum is 1000.
    public let limit: Int?
    /// The offset pagination that limits the number of returned records.
    ///
    /// The start of each page is offset by the specified number.
    /// You can apply offset to most API calls, but not all GET endpoints support it.
    /// The default is 0.
    public let offset: Int?

    public init(
        query: String? = nil,
        countryCode: String? = nil,
        entity: GeolocationEntity? = nil,
        pagination: Pagination? = nil
    ) {
        self.query = query
        self.countryCode = countryCode
        self.entity = entity
        self.limit = pagination?.limit
        self.offset = pagination?.offset
    }
}

struct GeolocationsSearchRequest: RequestType {
    let path = "/api/v5/search/geo"
    let method = HTTPMethod.get
    let query: RequestQuery?

    init(parameters: GeolocationsSearchParameters) {
        query = RequestQuery(parameters)
    }
}
