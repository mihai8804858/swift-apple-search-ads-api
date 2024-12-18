/// The geosearch request object.
public struct GeolocationRequest: Encodable, Equatable, Sendable {
    /// The geographic location in the format of countryOrRegion|adminArea|locality.
    /// A countryCode is an ISO alpha-2 country code string.
    /// An adminArea is a state or the equivalent according to its associated country.
    /// A locality is a city or the equivalent according to its associated adminArea.
    public let id: String
    /// The type of geography for targeting locations.
    /// Search results are in the preferred language according to your organization.
    public let entity: GeolocationEntity

    /// Create an instance of `GeolocationRequest`.
    ///
    /// - Parameters:
    ///     - id: The geographic location in the format of countryOrRegion|adminArea|locality.
    ///     - entity: The type of geography for targeting locations.
    public init(id: String, entity: GeolocationEntity) {
        self.id = id
        self.entity = entity
    }
}
