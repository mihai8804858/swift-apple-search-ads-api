import Foundation

/// The descriptions of metrics with dates.
public struct SpendRowExtended: Codable, Hashable, Sendable {
    /// The average CPM is the average amount you pay per one thousand ad impressions.
    public let avgCPM: Money?
    /// The average cost-per-tap (CPT) is the ratio of spend over taps.
    public let avgCPT: Money?
    /// The date range of the report. The format is MM-DD-YYYY HH.
    public let date: Date?
    /// The number of times your ad appears in App Store search results within the reporting period.
    public let impressions: Int?
    /// The total spend of a campaign in the currency the organization uses.
    public let localSpend: Money?
    /// The total campaign spend divided by the number of tap-through installs within the reporting period.
    public let tapInstallCPI: Money?
    /// The total number of tap-through installs divided by the total number of taps within the reporting period.
    public let tapInstallRate: Double?
    /// The total number of new downloads and redownloads from people
    /// who tapped your ad within a 30-day attribution window.
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
    /// The total number of pre-orders placed by users who tapped your ad.
    /// A pre-order placed (tap-through) is counted when a user has tapped your ad and authenticated with
    /// Face ID, Touch ID, or their passcode to allow the app to be downloaded on release day,
    /// within a 30-day window of the ad tap, and within 60 days of the app download.
    /// This does not account for any pre-orders canceled after the pre-order has been placed.
    public let tapPreOrdersPlaced: Int?
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
    /// The total number of tap-through and view-through pre-orders placed resulting from an ad
    /// within the reporting period.
    public let totalPreOrdersPlaced: Int?
    /// The tap-through rate (TTR) is the number of times people tap your ad
    /// divided by the total impressions your ad receives.
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
    /// The total number of pre-orders placed from users who viewed your ad, but didn’t tap it.
    /// A pre-order placed (view-through) is counted within 24 hours of viewing your ad, and within 60 days
    /// of the app download.
    /// This does not account for any pre-orders canceled after the pre-order has been placed.
    public let viewPreOrdersPlaced: Int?

    public init(
        avgCPM: Money? = nil,
        avgCPT: Money? = nil,
        date: Date? = nil,
        impressions: Int? = nil,
        localSpend: Money? = nil,
        tapInstallCPI: Money? = nil,
        tapInstallRate: Double? = nil,
        tapInstalls: Int? = nil,
        tapNewDownloads: Int? = nil,
        tapRedownloads: Int? = nil,
        tapPreOrdersPlaced: Int? = nil,
        taps: Int? = nil,
        totalAvgCPI: Money? = nil,
        totalInstallRate: Double? = nil,
        totalInstalls: Int? = nil,
        totalNewDownloads: Int? = nil,
        totalRedownloads: Int? = nil,
        totalPreOrdersPlaced: Int? = nil,
        ttr: Double? = nil,
        viewInstalls: Int? = nil,
        viewNewDownloads: Int? = nil,
        viewRedownloads: Int? = nil,
        viewPreOrdersPlaced: Int? = nil
    ) {
        self.avgCPM = avgCPM
        self.avgCPT = avgCPT
        self.date = date
        self.impressions = impressions
        self.localSpend = localSpend
        self.tapInstallCPI = tapInstallCPI
        self.tapInstallRate = tapInstallRate
        self.tapInstalls = tapInstalls
        self.tapNewDownloads = tapNewDownloads
        self.tapRedownloads = tapRedownloads
        self.tapPreOrdersPlaced = tapPreOrdersPlaced
        self.taps = taps
        self.totalAvgCPI = totalAvgCPI
        self.totalInstallRate = totalInstallRate
        self.totalInstalls = totalInstalls
        self.totalNewDownloads = totalNewDownloads
        self.totalRedownloads = totalRedownloads
        self.totalPreOrdersPlaced = totalPreOrdersPlaced
        self.ttr = ttr
        self.viewInstalls = viewInstalls
        self.viewNewDownloads = viewNewDownloads
        self.viewRedownloads = viewRedownloads
        self.viewPreOrdersPlaced = viewPreOrdersPlaced
    }

    enum CodingKeys: CodingKey {
        case avgCPM
        case avgCPT
        case date
        case impressions
        case localSpend
        case tapInstallCPI
        case tapInstallRate
        case tapInstalls
        case tapNewDownloads
        case tapRedownloads
        case tapPreOrdersPlaced
        case taps
        case totalAvgCPI
        case totalInstallRate
        case totalInstalls
        case totalNewDownloads
        case totalRedownloads
        case totalPreOrdersPlaced
        case ttr
        case viewInstalls
        case viewNewDownloads
        case viewRedownloads
        case viewPreOrdersPlaced
    }

    public init(from decoder: any Decoder) throws {
        let formatters = [
            DateFormatter.monthDayYearHour,
            DateFormatter.monthDayYear,
            DateFormatter.yearMonthDayHour,
            DateFormatter.yearMonthDay
        ]
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decodeIfPresent(String.self, forKey: .date).flatMap { dateString in
            formatters.compactMap { $0.date(from: dateString) }.first
        }
        avgCPM = try container.decodeIfPresent(Money.self, forKey: .avgCPM)
        avgCPT = try container.decodeIfPresent(Money.self, forKey: .avgCPT)
        impressions = try container.decodeIfPresent(Int.self, forKey: .impressions)
        localSpend = try container.decodeIfPresent(Money.self, forKey: .localSpend)
        tapInstallCPI = try container.decodeIfPresent(Money.self, forKey: .tapInstallCPI)
        tapInstallRate = try container.decodeIfPresent(Double.self, forKey: .tapInstallRate)
        tapInstalls = try container.decodeIfPresent(Int.self, forKey: .tapInstalls)
        tapNewDownloads = try container.decodeIfPresent(Int.self, forKey: .tapNewDownloads)
        tapRedownloads = try container.decodeIfPresent(Int.self, forKey: .tapRedownloads)
        tapPreOrdersPlaced = try container.decodeIfPresent(Int.self, forKey: .tapPreOrdersPlaced)
        taps = try container.decodeIfPresent(Int.self, forKey: .taps)
        totalAvgCPI = try container.decodeIfPresent(Money.self, forKey: .totalAvgCPI)
        totalInstallRate = try container.decodeIfPresent(Double.self, forKey: .totalInstallRate)
        totalInstalls = try container.decodeIfPresent(Int.self, forKey: .totalInstalls)
        totalNewDownloads = try container.decodeIfPresent(Int.self, forKey: .totalNewDownloads)
        totalRedownloads = try container.decodeIfPresent(Int.self, forKey: .totalRedownloads)
        totalPreOrdersPlaced = try container.decodeIfPresent(Int.self, forKey: .totalPreOrdersPlaced)
        ttr = try container.decodeIfPresent(Double.self, forKey: .ttr)
        viewInstalls = try container.decodeIfPresent(Int.self, forKey: .viewInstalls)
        viewNewDownloads = try container.decodeIfPresent(Int.self, forKey: .viewNewDownloads)
        viewRedownloads = try container.decodeIfPresent(Int.self, forKey: .viewRedownloads)
        viewPreOrdersPlaced = try container.decodeIfPresent(Int.self, forKey: .viewPreOrdersPlaced)
    }

    public func encode(to encoder: any Encoder) throws {
        let formatter = DateFormatter.monthDayYearHour
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(avgCPM, forKey: .avgCPM)
        try container.encodeIfPresent(avgCPT, forKey: .avgCPT)
        try container.encodeIfPresent(impressions, forKey: .impressions)
        try container.encodeIfPresent(localSpend, forKey: .localSpend)
        try container.encodeIfPresent(tapInstallCPI, forKey: .tapInstallCPI)
        try container.encodeIfPresent(tapInstallRate, forKey: .tapInstallRate)
        try container.encodeIfPresent(tapInstalls, forKey: .tapInstalls)
        try container.encodeIfPresent(tapNewDownloads, forKey: .tapNewDownloads)
        try container.encodeIfPresent(tapRedownloads, forKey: .tapRedownloads)
        try container.encodeIfPresent(tapPreOrdersPlaced, forKey: .tapPreOrdersPlaced)
        try container.encodeIfPresent(taps, forKey: .taps)
        try container.encodeIfPresent(totalAvgCPI, forKey: .totalAvgCPI)
        try container.encodeIfPresent(totalInstallRate, forKey: .totalInstallRate)
        try container.encodeIfPresent(totalInstalls, forKey: .totalInstalls)
        try container.encodeIfPresent(totalNewDownloads, forKey: .totalNewDownloads)
        try container.encodeIfPresent(totalRedownloads, forKey: .totalRedownloads)
        try container.encodeIfPresent(totalPreOrdersPlaced, forKey: .totalPreOrdersPlaced)
        try container.encodeIfPresent(ttr, forKey: .ttr)
        try container.encodeIfPresent(viewInstalls, forKey: .viewInstalls)
        try container.encodeIfPresent(viewNewDownloads, forKey: .viewNewDownloads)
        try container.encodeIfPresent(viewRedownloads, forKey: .viewRedownloads)
        try container.encodeIfPresent(viewPreOrdersPlaced, forKey: .viewPreOrdersPlaced)
        if let date { try container.encode(formatter.string(from: date), forKey: .date) }
    }
}
