public struct SupportedCountriesOrRegionsParameters: Equatable, Encodable, Sendable {
    private let countriesOrRegions: String

    /// Filters by ISO alpha-2 country codes.
    public var countriesOrRegionsList: [String] {
        countriesOrRegions.split { $0 == "," }.map(String.init)
    }

    public init(countriesOrRegions: [String]) {
        self.countriesOrRegions = countriesOrRegions.joined(separator: ",")
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
