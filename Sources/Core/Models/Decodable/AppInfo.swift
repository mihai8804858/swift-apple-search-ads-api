/// The response to an app search request.
public struct AppInfo: Decodable, Equatable, Sendable {
    /// Your unique App Store Connect app identifier.
    public let adamId: Int
    /// The name of the app.
    public let appName: String
    /// The developer name for the app.
    public let developerName: String
    /// A list of ISO alpha-2 country code strings.
    public let countryOrRegionCodes: [String]

    /// Create an instance of `AppInfo`.
    ///
    /// - Parameters:
    ///     - adamId: Your unique App Store Connect app identifier.
    ///     - appName: The name of the app.
    ///     - developerName: The developer name for the app.
    ///     - countryOrRegionCodes: A list of ISO alpha-2 country code strings.
    public init(adamId: Int, appName: String, developerName: String, countryOrRegionCodes: [String]) {
        self.adamId = adamId
        self.appName = appName
        self.developerName = developerName
        self.countryOrRegionCodes = countryOrRegionCodes
    }
}
