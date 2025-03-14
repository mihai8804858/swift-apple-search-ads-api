public struct SupportedCountriesOrRegionsParameters: Hashable, Encodable, Sendable {
    /// Filters by ISO alpha-2 country codes.
    public let countriesOrRegions: String?

    public init(countriesOrRegions: [String]? = nil) {
        self.countriesOrRegions = countriesOrRegions?.joined(separator: ",")
    }
}

struct SupportedCountriesOrRegionsRequest: RequestType {
    let path = "/api/v5/countries-or-regions"
    let method = HTTPMethod.get
    let query: RequestQuery?

    init(parameters: SupportedCountriesOrRegionsParameters) {
        query = RequestQuery(parameters)
    }
}
