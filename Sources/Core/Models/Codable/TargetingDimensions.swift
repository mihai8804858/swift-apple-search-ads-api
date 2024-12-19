/// The optional criteria to use with ad groups to narrow the audience that views your ads.
public struct TargetingDimensions: Codable, Equatable, Sendable {
    /// The dimension to target users by age demographic.
    /// Limit the age group you want to show your ad to.
    /// You must set a minimum age.
    /// To include multiple ranges, input them as a list.
    public let age: AgeCriteria?
    /// The dimension to target users by gender demographic.
    /// Specify the gender you want to show your ad to.
    /// To specify all genders, set the value to null.
    public let gender: GenderCriteria?
    /// The dimension to include target audience by app category.
    /// Only applicable to campaigns using a `SupplySource` of `APPSTORE_PRODUCT_PAGES_BROWSE`.
    public let appCategories: AppCategoryCriteria?
    /// The dimension to include users who have downloaded your app or to exclude users who haven’t downloaded your app.
    /// Each campaign can promote only one app per adamId.
    public let appDownloaders: AppDownloaderCriteria?
    /// The dimension to target users by country or region.
    public let country: CountryCriteria?
    /// The dimension to target users by admin area.
    /// An admin area is a state or the equivalent according to its associated country.
    public let adminArea: AdminAreaCriteria?
    /// The dimension to target users by locality.
    /// A locality is a city or the equivalent according to its associated admin area.
    public let locality: LocalityCriteria?
    /// The dimension to target users by a specific time of day.
    /// Numbers ranging from 0 to 167 represent the hours of a week beginning at Sunday 12:00 midnight.
    /// For example, the hour beginning Monday at 1:00 a.m. is 25.
    public let daypart: DaypartCriteria?
    /// The dimension to target users by device class.
    /// This defaults to the device classes that the promoted app supports.
    public let deviceClass: DeviceClassCriteria?

    public init(
        age: AgeCriteria? = nil,
        gender: GenderCriteria? = nil,
        appCategories: AppCategoryCriteria? = nil,
        appDownloaders: AppDownloaderCriteria? = nil,
        country: CountryCriteria? = nil,
        adminArea: AdminAreaCriteria? = nil,
        locality: LocalityCriteria? = nil,
        daypart: DaypartCriteria? = nil,
        deviceClass: DeviceClassCriteria? = nil
    ) {
        self.age = age
        self.gender = gender
        self.appCategories = appCategories
        self.appDownloaders = appDownloaders
        self.country = country
        self.adminArea = adminArea
        self.locality = locality
        self.daypart = daypart
        self.deviceClass = deviceClass
    }
}
