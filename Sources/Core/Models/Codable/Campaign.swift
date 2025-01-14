import Foundation

/// The response to a request to create and fetch campaigns.
public struct Campaign: Codable, Equatable, Sendable, CodingKeysContaining {
    /// The status of the campaign.
    public enum Status: String, Codable, Equatable, Sendable {
        /// The campaign is enabled.
        case enabled = "ENABLED"
        /// The campaign is paused.
        case paused = "PAUSED"
    }

    /// The status of the campaign.
    public enum DisplayStatus: String, Codable, Equatable, Sendable {
        /// The campaign is running.
        case running = "RUNNING"
        /// The campaign is on hold for one or more reasons.
        case onHold = "ON_HOLD"
        /// The campaign is paused by the user.
        case paused = "PAUSED"
        /// The campaign has been deleted by the user
        case deleted = "DELETED"
    }

    /// The status of the campaign.
    public enum ServingStatus: String, Codable, Equatable, Sendable {
        /// The campaign is running.
        case running = "RUNNING"
        /// The campaign is not running.
        case notRunning = "NOT_RUNNING"
    }

    /// The channel type of an ad in a campaign.
    public enum AdChannelType: String, Codable, Equatable, Sendable {
        /// When the `SupplySource` is `APPSTORE_SEARCH_RESULTS`, the `adChannelType` needs to be `SEARCH`.
        case search = "SEARCH"
        /// When the `SupplySource` is `APPSTORE_SEARCH_TAB`, `APPSTORE_PRODUCT_PAGES_BROWSE`, or `APPSTORE_TODAY_TAB`,
        /// the `adChannelType` needs to be `DISPLAY`.
        case display = "DISPLAY"
    }

    /// The type of billing event for a campaign.
    public enum BillingEventType: String, Codable, Equatable, Sendable {
        /// The cost to the advertiser is per tap.
        /// When the `SupplySources` value is `APPSTORE_SEARCH_RESULTS` or `APPSTORE_SEARCH_TAB`,
        /// the billingEvent must be `TAPS`.
        case taps = "TAPS"
        /// The cost to the advertiser is per impression served.
        case impressions = "IMPRESSIONS"
    }

    /// Reason the system provides when a campaign can’t run.
    public enum ServingStateReason: String, Codable, Equatable, Sendable {
        /// The ad group is missing from the campaign.
        case adGroupMissing = "AD_GROUP_MISSING"
        /// The app doesn’t have an assigned category.
        case appNotCategorized = "APP_NOT_CATEGORIZED"
        /// The app isn’t eligible in App Store Connect.
        case appNotEligible = "APP_NOT_ELIGIBLE"
        /// The app isn’t eligible for Apple Search Ads.
        case appNotEligibleSearchAds = "APP_NOT_ELIGIBLE_SEARCHADS"
        /// The app isn’t eligible for promotion with the supply source.
        case appNotEligibleSupplySource = "APP_NOT_ELIGIBLE_SUPPLY_SOURCE"
        /// The app is no longer associated with any of the content providers linked to the campaign group.
        case appNotLinkedToCampaignGroup = "APP_NOT_LINKED_TO_CAMPAIGN_GROUP"
        /// The app hasn’t been published on the App Store.
        case appNotPublishedYet = "APP_NOT_PUBLISHED_YET"
        /// The app isn’t eligible due to the sensitive content policy.
        case appSensitiveContent = "APP_SENSITIVE_CONTENT"
        /// The budget order start date is in the future.
        case boStartDateInFuture = "BO_START_DATE_IN_FUTURE"
        /// The budget order end date is in the past.
        case boEndDateReached = "BO_END_DATE_REACHED"
        /// The budget order is exhausted.
        case boExhausted = "BO_EXHAUSTED"
        /// The campaign end date is in the past.
        case campaignEndDateReached = "CAMPAIGN_END_DATE_REACHED"
        /// The campaign start date is in the future.
        case campaignStartDateInFuture = "CAMPAIGN_START_DATE_IN_FUTURE"
        /// The app’s content provider isn’t linked to the campaign group.
        case contentProviderUnlinked = "CONTENT_PROVIDER_UNLINKED"
        /// The system has declined the credit card charge.
        case creditCardDeclined = "CREDIT_CARD_DECLINED"
        /// The campaign daily cap is exhausted.
        case dailyCapExhausted = "DAILY_CAP_EXHAUSTED"
        /// The user has deleted the campaign.
        case deletedByUser = "DELETED_BY_USER"
        /// A pricing model of CPT isn’t available.
        /// See section 4.4 in Apple Search Ads Campaign Management API 4 for additional details.
        case featureNoLongerAvailable = "FEATURE_NO_LONGER_AVAILABLE"
        /// A feature isn’t yet available.
        case featureNotYetAvailable = "FEATURE_NOT_YET_AVAILABLE"
        /// The account business profile location isn’t eligible.
        case ineligibleBusinessLocation = "INELIGIBLE_BUSINESS_LOCATION"
        /// The line of credit is exhausted.
        case locExhausted = "LOC_EXHAUSTED"
        /// The budget order is missing or has missing fields.
        case missingBoOrInvoicingFields = "MISSING_BO_OR_INVOICING_FIELDS"
        /// The campaign has no ad groups running.
        case noAvailableAdGroups = "NO_AVAILABLE_AD_GROUPS"
        /// The campaign has no eligible countries for the campaign to run.
        case noEligibleCountries = "NO_ELIGIBLE_COUNTRIES"
        /// The organization doesn’t have a payment method.
        case noPaymentMethodOnFile = "NO_PAYMENT_METHOD_ON_FILE"
        /// The organization has a disputed chargeback.
        case orgChargeBackDisputed = "ORG_CHARGE_BACK_DISPUTED"
        /// The organization’s payment type has changed.
        case orgPaymentTypeChanged = "ORG_PAYMENT_TYPE_CHANGED"
        /// The organization can’t run a campaign.
        case orgSuspendedPolicyViolation = "ORG_SUSPENDED_POLICY_VIOLATION"
        /// The organization can’t run a campaign.
        case orgSuspendedFraud = "ORG_SUSPENDED_FRAUD"
        /// The user has paused the campaign.
        case pausedByUser = "PAUSED_BY_USER"
        /// The system has paused the campaign.
        case pausedBySystem = "PAUSED_BY_SYSTEM"
        /// An agency hasn’t identified as an agency through their Search Ads account.
        case sapinLawAgentUnknown = "SAPIN_LAW_AGENT_UNKNOWN"
        /// An app is owned by a business that is headquartered or has a branch in France,
        /// but hasn’t self-identified as an agency in their Search Ads account.
        case sapinLawFrenchBizUnknown = "SAPIN_LAW_FRENCH_BIZ_UNKNOWN"
        /// An app is owned by a business that is headquartered or has a branch in France,
        /// and has self-identified as an agency in their Search Ads account.
        case sapinLawFrenchBiz = "SAPIN_LAW_FRENCH_BIZ"
        /// The organization’s tax verification is pending.
        case taxVerificationPending = "TAX_VERIFICATION_PENDING"
        /// The campaign budget is exhausted.
        case totalBudgetExhausted = "TOTAL_BUDGET_EXHAUSTED"
        /// The user requested suspension of the account.
        case userRequestedAccountSuspension = "USER_REQUESTED_ACCOUNT_SUSPENSION"
    }

    /// Reasons that displays when a campaign can’t run.
    public enum CountryOrRegionsServingStateReason: String, Codable, Equatable, Sendable {
        /// The app doesn't support the country language.
        case appLanguageIncompatible = "APP_LANGUAGE_INCOMPATIBLE"
        /// The app is not eligible in App Store Connect.
        case appNotEligible = "APP_NOT_ELIGIBLE"
        /// The app is not eligible for Apple Search Ads.
        case appNotEligibleSearchAds = "APP_NOT_ELIGIBLE_SEARCHADS"
        /// The app has not been published on the App Store.
        case appNotPublishedYet = "APP_NOT_PUBLISHED_YET"
        /// The app is not eligible for promotion with the SupplySource.
        case appNotEligibleSupplySource = "APP_NOT_ELIGIBLE_SUPPLY_SOURCE"
        /// The app content approval has been rejected.
        case appContentRejected = "APP_CONTENT_REJECTED"
        /// The app’s content review is successful.
        case appContentReviewPending = "APP_CONTENT_REVIEW_PENDING"
        /// The app’s business documents expired.
        case appDocApprovalExpired = "APP_DOC_APPROVAL_EXPIRED"
        /// The app’s business documents have been removed.
        case appDocApprovalInfected = "APP_DOC_APPROVAL_INFECTED"
        /// The app’s business documents require approval.
        case appDocApprovalNotSubmitted = "APP_DOC_APPROVAL_NOT_SUBMITTED"
        /// The app’s business documents approval is pending.
        case appDocApprovalPending = "APP_DOC_APPROVAL_PENDING"
        /// The app’s business documents approval has been rejected.
        case appDocApprovalRejected = "APP_DOC_APPROVAL_REJECTED"
        /// The account’s business documents have expired.
        case accountDocApprovalExpired = "ACCOUNT_DOC_APPROVAL_EXPIRED"
        /// The account’s business documents have been removed.
        case accountDocApprovalInfected = "ACCOUNT_DOC_APPROVAL_INFECTED"
        /// The account’s business documents have not been submitted.
        case accountDocApprovalNotSubmitted = "ACCOUNT_DOC_APPROVAL_NOT_SUBMITTED"
        /// The account’s business documents approval is pending.
        case accountDocApprovalPending = "ACCOUNT_DOC_APPROVAL_PENDING"
        /// The account’s business documents approval has been rejected.
        case accountDocApprovalRejected = "ACCOUNT_DOC_APPROVAL_REJECTED"
        /// A feature is not available in a CountryOrRegion.
        case featureNotAvailableInCountryOrRegion = "FEATURE_NOT_AVAILABLE_IN_COUNTRY_OR_REGION"
        /// An agency has not identified as an agency through their Search Ads account.
        case sapinLawAgentUnknown = "SAPIN_LAW_AGENT_UNKNOWN"
        /// An app is owned by a business that is headquartered or has a branch in France but
        /// has not self-identified as an agency in their Search Ads account.
        case sapinLawFrenchBizUnknown = "SAPIN_LAW_FRENCH_BIZ_UNKNOWN"
        /// An app is owned by a business that is headquartered or has a branch in France and
        /// has self-identified as an agency in their Search Ads account.
        case sapinLawFrenchBiz = "SAPIN_LAW_FRENCH_BIZ"
    }

    /// A unique identifier for the campaign that you can use as a campaignid in endpoint resources.
    public let id: Int?
    /// The identifier of the organization that owns the campaign.
    ///
    /// Your `orgId` is the same as your account in the Apple Search Ads UI.
    public let orgId: Int?
    /// Your unique App Store app identifier.
    ///
    /// You can obtain your app `adamId` through Search for iOS apps, Get a Campaign, or Get all Campaigns.
    public let adamId: Int
    /// The channel type of an ad in a campaign.
    public let adChannelType: AdChannelType
    /// The type of billing event for a campaign.
    public let billingEvent: BillingEventType
    /// The lifetime budget amount available to a campaign.
    ///
    /// If you update a `budgetAmount`, the updated amount must be greater than the previous budgetAmount and
    /// must exceed the lifetime spend of the campaign.
    public let budgetAmount: Money?
    /// The budget orders that you assign to the campaign.
    ///
    /// This applies only to campaigns with a line-of-credit payment model.
    /// This field is updatable.
    public let budgetOrders: [Int]?
    /// The App Store geoterritories where you’re promoting your app.
    ///
    /// The default value is US.
    /// Use an alpha-2 country code value , such as US, for the locations where you’re promoting.
    public let countriesOrRegions: [String]
    /// The map of reasons that returns when a campaign isn’t running.
    public let countryOrRegionServingStateReasons: [String: [CountryOrRegionsServingStateReason]]?
    /// The date and time of the creation of the campaign object.
    public let creationTime: Date?
    /// Your daily budget.
    ///
    /// - A `dailyBudgetAmount` is required field for all new campaigns, even if a `budgetAmount` is specified.
    /// - A `dailyBudgetAmount` can be changed but not removed from the payload when updating an existing campaign.
    /// - Your `dailyBudgetAmount` must be less than your `budgetAmount`.
    /// - Your `dailyBudgetAmount` must be greater than or equal to the `defaultBidAmount` in your ad group.
    public let dailyBudgetAmount: Money
    /// The indicator of whether the campaign is soft-deleted.
    public let deleted: Bool?
    /// The status of the campaign.
    ///
    /// The status resolves according to `servingStatus` and additional criteria.
    public let displayStatus: DisplayStatus?
    /// The scheduled end time and date for the campaign.
    ///
    /// - The `endTime` must be after the `startTime`.
    /// - The `endTime` is updatable until you reach the designated time.
    /// - The `endTime` must be in UTC.
    public let endTime: Date?
    /// The standard invoice details that you can set and edit using the LOCInvoiceDetails object.
    ///
    /// This field is updatable.
    public let locInvoiceDetails: LOCInvoiceDetails?
    /// The date and time of the most recent modification of the object.
    public let modificationTime: Date?
    /// The name of the campaign, which is unique within an organization.
    ///
    /// This field is updatable.
    /// Maximum Length: 200.
    public let name: String
    /// The payment model that you set through the Search Ads UI.
    ///
    /// If you don’t set a payment model, campaigns can’t run.
    /// If you don’t select a payment model, you can still create campaigns.
    /// You must select a payment model before a campaign is eligible to run.
    public let paymentModel: PaymentModel?
    /// The status of the campaign.
    public let servingStatus: ServingStatus?
    /// A list of reasons that displays when a campaign can’t run.
    public let servingStateReasons: [ServingStateReason]?
    /// The scheduled start time and date for the campaign.
    ///
    /// The `startTime` must be greater than the current time, and before the campaign endTime, if you set it.
    /// If you don’t set a `startTime`, the campaign defaults to the campaign request timestamp
    /// and the `startTime` is updatable until you reach the designated time.
    /// The `startTime` must be in UTC.
    public let startTime: Date?
    /// The user-controlled status to enable or pause the campaign.
    ///
    /// This field is updatable.
    public let status: Status?
    /// The ad placements for a campaign.
    public let supplySources: [SupplySource]?

    public init(
        id: Int? = nil,
        orgId: Int? = nil,
        adamId: Int,
        adChannelType: AdChannelType,
        billingEvent: BillingEventType,
        budgetAmount: Money? = nil,
        budgetOrders: [Int]? = nil,
        countriesOrRegions: [String],
        countryOrRegionServingStateReasons: [String: [CountryOrRegionsServingStateReason]]? = nil,
        creationTime: Date? = nil,
        dailyBudgetAmount: Money,
        deleted: Bool? = nil,
        displayStatus: DisplayStatus? = nil,
        endTime: Date? = nil,
        locInvoiceDetails: LOCInvoiceDetails? = nil,
        modificationTime: Date? = nil,
        name: String,
        paymentModel: PaymentModel? = nil,
        servingStatus: ServingStatus? = nil,
        servingStateReasons: [ServingStateReason]? = nil,
        startTime: Date? = nil,
        status: Status? = nil,
        supplySources: [SupplySource]? = nil
    ) {
        self.id = id
        self.orgId = orgId
        self.adamId = adamId
        self.name = name
        self.adChannelType = adChannelType
        self.supplySources = supplySources
        self.status = status
        self.displayStatus = displayStatus
        self.servingStatus = servingStatus
        self.servingStateReasons = servingStateReasons
        self.countriesOrRegions = countriesOrRegions
        self.countryOrRegionServingStateReasons = countryOrRegionServingStateReasons
        self.billingEvent = billingEvent
        self.budgetAmount = budgetAmount
        self.dailyBudgetAmount = dailyBudgetAmount
        self.budgetOrders = budgetOrders
        self.paymentModel = paymentModel
        self.locInvoiceDetails = locInvoiceDetails
        self.deleted = deleted
        self.creationTime = creationTime
        self.modificationTime = modificationTime
        self.startTime = startTime
        self.endTime = endTime
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case orgId
        case adamId
        case name
        case adChannelType
        case supplySources
        case status
        case displayStatus
        case servingStatus
        case servingStateReasons
        case countriesOrRegions
        case countryOrRegionServingStateReasons
        case billingEvent
        case budgetAmount
        case dailyBudgetAmount
        case budgetOrders
        case paymentModel
        case locInvoiceDetails
        case deleted
        case creationTime
        case modificationTime
        case startTime
        case endTime
    }
}
