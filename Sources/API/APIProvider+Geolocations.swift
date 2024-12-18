public extension APIProvider {
    /// Fetches a list of geolocations for targeting.
    ///
    /// - Parameters:
    ///     - query: The query search pattern uses a prefix-matching algorithm.
    ///     - countryCode: The country or region to serve ads in.
    ///     Campaigns that serve multiple countries or regions can’t use geotargeting.
    ///     The query uses a countrycode value in an ISO alpha-2 country code format.
    ///     - entity: The country, admin area, or locality locations available for targeting.
    ///     - pagination: The offset and limit pagination that limits the number of records returned.
    ///
    /// - Returns: A paginated list of `GeolocationSearchEntity`.
    ///
    /// - Throws: An error of type `APIError`
    func searchGeolocations(
        query: String? = nil,
        countryCode: String? = nil,
        entity: GeolocationEntity? = nil,
        pagination: Pagination? = nil
    ) async throws -> Response<Paginated<[GeolocationSearchEntity]>> {
        try await provider.requestPaginatedModel(from: SearchGeolocationsRequest(
            query: query,
            countryCode: countryCode,
            entity: entity,
            pagination: pagination
        ))
    }

    /// Gets geolocation details using a geoidentifier.
    ///
    /// - Parameters:
    ///     - requests: The geosearch request objects.
    ///     - pagination: The offset and limit pagination that limits the number of records returned.
    ///
    /// - Returns: A paginated list of `GeolocationSearchEntity`.
    ///
    /// - Throws: An error of type `APIError`
    func listGeolocations(
        requests: [GeolocationRequest],
        pagination: Pagination? = nil
    ) async throws -> Response<Paginated<[GeolocationSearchEntity]>> {
        try await provider.requestPaginatedModel(from: ListGeolocationsRequest(
            requests: requests,
            pagination: pagination
        ))
    }
}
