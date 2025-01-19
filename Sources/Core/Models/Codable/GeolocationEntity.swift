/// The country, AdminArea, or Locality locations available for targeting.
///
/// The entity parameter searches the displayNames for country, admin area, and locality in all languages.
/// Search results in the response payload are in the preferred language according to your organization.
/// If you don’t input a query parameter, all applicable values return in the response payload as a default.
public enum GeolocationEntity: String, Codable, Hashable, Sendable {
    /// The country to serve ads in.
    case country = "Country"
    /// The state or the equivalent according to its associated country.
    case adminArea = "AdminArea"
    /// The city or the equivalent according to its associated admin area.
    case locality = "Locality"
}
