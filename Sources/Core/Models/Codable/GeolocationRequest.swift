/// The geosearch request object.
public struct GeolocationRequest: Codable, Equatable, Sendable {
    /// The geographic location in the format of countryOrRegion|adminArea|locality.
    /// A countryCode is an ISO alpha-2 country code string.
    /// An adminArea is a state or the equivalent according to its associated country.
    /// A locality is a city or the equivalent according to its associated adminArea.
    public let id: String
    /// The type of geography for targeting locations.
    /// Search results are in the preferred language according to your organization.
    public let entity: GeolocationEntity

    public init(id: String, entity: GeolocationEntity) {
        self.id = id
        self.entity = entity
    }
}
