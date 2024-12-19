/// Geolocation that includes the geoidentifier and entity type.
public struct GeolocationSearchEntity: Codable, Equatable, Sendable {
    /// The geographic location in the format of countryOrRegion|adminArea|locality.
    public let id: String
    /// A state or the equivalent according to its associated country.
    public let entity: GeolocationEntity
    /// The geographic targeting location in the format of locality, adminArea, countryOrRegion.
    public let displayName: String
    /// The geoterritory where you’re promoting your app in ISO alpha-2 country code format.
    public let countryOrRegion: String?
    /// A city or the equivalent according to its associated adminArea.
    public let adminArea: String?
    /// The type of geography for targeting locations.
    /// Search results are in the preferred language according to your organization.
    public let locality: String?

    public init(
        id: String,
        entity: GeolocationEntity,
        displayName: String,
        countryOrRegion: String?,
        adminArea: String?,
        locality: String?
    ) {
        self.id = id
        self.entity = entity
        self.displayName = displayName
        self.countryOrRegion = countryOrRegion
        self.adminArea = adminArea
        self.locality = locality
    }
}
