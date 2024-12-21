struct SupportedCountriesOrRegionsRequest: RequestType {
    let path = "/api/v5/countries-or-regions"
    let method = HTTPMethod.get
    let task: RequestTask

    init(countriesOrRegions: [String]) {
        task = .parameterized(EncodedParameters(
            encoding: URLEncoding.queryString,
            parameters: URLParameters(["countriesOrRegions": countriesOrRegions])
        ))
    }
}
