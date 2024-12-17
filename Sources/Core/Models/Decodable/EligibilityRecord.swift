/// App eligibility parameters that an API response returns.
public struct EligibilityRecord: Decodable, Equatable, Sendable {
    /// The eligible devices you can use for targeting.
    public enum State: String, Decodable, Equatable, Sendable {
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

    /// Create an instance of `EligibilityRecord`.
    ///
    /// - Parameters:
    ///     - adamId: Your unique App Store app identifier.
    ///     - countryOrRegion: The App Store geoterritories where you’re promoting your app.
    ///     The value is an ISO 3166-1 alpha-2 country code.
    ///     - deviceClass: The eligible devices you can use for targeting.
    ///     - minAge: The minimum age you can use to create an ad group.
    ///     - state: The system state of the app eligibility review process.
    ///     - supplySource: The ad placements eligible for a campaign.
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
}
