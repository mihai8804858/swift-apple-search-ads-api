/// App eligibility parameters that an API response returns.
public struct EligibilityRecord: Codable, Hashable, Sendable, CodingKeysContaining, Identifiable {
    /// The eligible devices you can use for targeting.
    public enum State: String, Codable, Hashable, Sendable {
        case eligible = "ELIGIBLE"
        case ineligible = "INELIGIBLE"
    }

    /// Your unique App Store app identifier.
    public let adamId: Int
    /// The App Store geoterritories where you’re promoting your app. The value is an ISO 3166-1 alpha-2 country code.
    public let countryOrRegion: String
    /// The eligible devices you can use for targeting.
    public let deviceClass: DeviceClass
    /// The minimum age you can use to create an ad group.
    public let minAge: Int
    /// The system state of the app eligibility review process.
    public let state: State
    /// The ad placements eligible for a campaign.
    public let supplySource: SupplySource

    public var id: Int { adamId }

    public init(
        adamId: Int,
        countryOrRegion: String,
        deviceClass: DeviceClass,
        minAge: Int,
        state: State,
        supplySource: SupplySource
    ) {
        self.adamId = adamId
        self.countryOrRegion = countryOrRegion
        self.deviceClass = deviceClass
        self.minAge = minAge
        self.state = state
        self.supplySource = supplySource
    }

    public enum CodingKeys: String, CodingKey {
        case adamId
        case countryOrRegion
        case deviceClass
        case minAge
        case state
        case supplySource
    }
}
