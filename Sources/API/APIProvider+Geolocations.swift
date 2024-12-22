public extension APIProvider {
    /// Fetches a list of geolocations for targeting.
    ///
    /// - Parameters:
    ///     - parameters: Geolocations search parameters.
    ///
    /// - Returns: A paginated list of `GeolocationSearchEntity`.
    ///
    /// - Throws: An error of type `APIError`.
    func searchGeolocations(
        parameters: GeolocationsSearchParameters
    ) async throws -> Response<Paginated<[GeolocationSearchEntity]>> {
        try await provider.requestPaginatedModel(from: GeolocationsSearchRequest(parameters: parameters))
    }

    /// Gets geolocation details using a geoidentifier.
    ///
    /// - Parameters:
    ///     - requests: The geosearch request objects.
    ///     - pagination: The offset and limit pagination that limits the number of records returned.
    ///
    /// - Returns: A paginated list of `GeolocationSearchEntity`.
    ///
    /// - Throws: An error of type `APIError`.
    func listGeolocations(
        requests: [GeolocationRequest],
        pagination: Pagination? = nil
    ) async throws -> Response<Paginated<[GeolocationSearchEntity]>> {
        try await provider.requestPaginatedModel(from: GeolocationsListRequest(
            requests: requests,
            pagination: pagination
        ))
    }
}
