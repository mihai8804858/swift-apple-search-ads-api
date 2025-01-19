/// The reporting response metrics.
public struct SpendRow: Codable, Hashable, Sendable {
    /// The average CPM is the average amount you pay per one thousand ad impressions.
    public let avgCPM: Money?
    /// The average cost-per-tap (CPT) is the ratio of spend over taps.
    public let avgCPT: Money?
    /// The number of times your ad appears in App Store search results within the reporting period.
    public let impressions: Int?
    /// The total spend of a campaign in the currency the organization uses.
    public let localSpend: Money?
    /// The total campaign spend divided by the number of tap-through installs within the reporting period.
    public let tapInstallCPI: Money?
    /// The total number of tap-through installs divided by the total number of taps within the reporting period.
    public let tapInstallRate: Double?
    /// The total number of new downloads and redownloads from people who tapped
    /// your ad within a 30-day attribution window.
    public let tapInstalls: Int?
    /// New downloads from people who tapped your ad within a 30-day attribution window.
    ///
    /// The API counts new downloads when someone downloads your app to a device
    /// where your app hasn’t previously been installed.
    public let tapNewDownloads: Int?
    /// Redownloads from people who tapped your ad within a 30-day attribution window.
    ///
    /// The API counts redownloads when someone downloads your app, deletes it,
    /// and downloads it again on the same device, or a different one, following an ad tap.
    public let tapRedownloads: Int?
    /// The number of times people tap your ad within the reporting period.
    public let taps: Int?
    /// The total campaign spend divided by the total number of installs within the reporting period.
    public let totalAvgCPI: Money?
    /// The total number of installs divided by the total number of taps within the reporting period.
    public let totalInstallRate: Double?
    /// The total number of tap-through and view-through new downloads and redownloads within the reporting period.
    public let totalInstalls: Int?
    /// The total number of tap-through and view-through new downloads within the reporting period.
    public let totalNewDownloads: Int?
    /// The total number of tap-through and view-through redownloads within the reporting period.
    public let totalRedownloads: Int?
    /// The tap-through rate (TTR) is the number of times people tap your ad divided
    /// by the total impressions your ad receives.
    public let ttr: Double?
    /// The total number of new downloads and redownloads from people who viewed your ad,
    /// but didn’t tap it, within a 1-day attribution window.
    public let viewInstalls: Int?
    /// New downloads from people who viewed your ad, but didn’t tap it, within a 1-day attribution window.
    /// The API counts new downloads when someone downloads your app to a device
    /// where your app hasn’t previously been installed.
    public let viewNewDownloads: Int?
    /// Redownloads from people who viewed your ad, but didn’t tap it, within a 1-day attribution window.
    /// The API counts redownloads when someone downloads your app, deletes it,
    /// and downloads it again on the same device, or a different one, following an ad view.
    public let viewRedownloads: Int?

    public init(
        avgCPM: Money? = nil,
        avgCPT: Money? = nil,
        impressions: Int? = nil,
        localSpend: Money? = nil,
        tapInstallCPI: Money? = nil,
        tapInstallRate: Double? = nil,
        tapInstalls: Int? = nil,
        tapNewDownloads: Int? = nil,
        tapRedownloads: Int? = nil,
        taps: Int? = nil,
        totalAvgCPI: Money? = nil,
        totalInstallRate: Double? = nil,
        totalInstalls: Int? = nil,
        totalNewDownloads: Int? = nil,
        totalRedownloads: Int? = nil,
        ttr: Double? = nil,
        viewInstalls: Int? = nil,
        viewNewDownloads: Int? = nil,
        viewRedownloads: Int? = nil
    ) {
        self.avgCPM = avgCPM
        self.avgCPT = avgCPT
        self.impressions = impressions
        self.localSpend = localSpend
        self.tapInstallCPI = tapInstallCPI
        self.tapInstallRate = tapInstallRate
        self.tapInstalls = tapInstalls
        self.tapNewDownloads = tapNewDownloads
        self.tapRedownloads = tapRedownloads
        self.taps = taps
        self.totalAvgCPI = totalAvgCPI
        self.totalInstallRate = totalInstallRate
        self.totalInstalls = totalInstalls
        self.totalNewDownloads = totalNewDownloads
        self.totalRedownloads = totalRedownloads
        self.ttr = ttr
        self.viewInstalls = viewInstalls
        self.viewNewDownloads = viewNewDownloads
        self.viewRedownloads = viewRedownloads
    }
}
