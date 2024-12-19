/// The response to ACL requests.
public struct UserACL: Codable, Equatable, Sendable {
    /// The identifier of the organization that owns the campaign.
    /// Your orgId is the same as your account in the Apple Search Ads UI.
    public let orgId: Int
    /// The name of your organization.
    public let orgName: String
    /// Distinguishes the account from an orgId belonging to a suborganization.
    public let parentOrgId: Int?
    /// The organization’s default currency that is set up in the Apple Search Ads UI.
    public let currency: String
    /// The payment model that you set through the Apple Search Ads UI.
    public let paymentModel: PaymentModel
    /// Each role governs what a user can see and do within the account.
    /// - API Account Manager
    ///     - Manage all campaigns within an account with read-and-write capabilities.
    ///     - View reporting across the organization.
    ///     - Create and edit an API public key.
    /// - API Account Read Only
    ///     - View reporting across the account with read-only permission.
    ///     - Create and edit an API public key.
    /// - Limited Access: API Read & Write
    ///     - View reporting.
    ///     - Manage all campaigns and settings within a campaign group with read-and-write capabilities.
    ///     - Create and edit an API public key.
    /// - Limited Access: API Read Only
    ///     - View reporting across the organization.
    ///     - Create and edit an API public key.
    public let roleNames: [String]
    /// The time zone you set during account creation through the Search Ads UI.
    /// ORTZ, the organization time zone, is the default.
    public let timeZone: String

    public init(
        orgId: Int,
        orgName: String,
        parentOrgId: Int?,
        currency: String,
        paymentModel: PaymentModel,
        roleNames: [String],
        timeZone: String
    ) {
        self.orgId = orgId
        self.orgName = orgName
        self.parentOrgId = parentOrgId
        self.currency = currency
        self.paymentModel = paymentModel
        self.roleNames = roleNames
        self.timeZone = timeZone
    }
}
