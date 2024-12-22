public struct SupportedCountriesOrRegionsParameters: Equatable, Encodable, Sendable {
    /// Filters by ISO alpha-2 country codes using one or more comma-separated values.
    public let countriesOrRegions: [String]

    public init(countriesOrRegions: [String]) {
        self.countriesOrRegions = countriesOrRegions
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
