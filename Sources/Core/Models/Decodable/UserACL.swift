import Foundation

public struct UserACL: Decodable, Sendable {
    public let orgId: Int
    public let orgName: String
    public let parentOrgId: Int?
    public let currency: String
    public let paymentModel: PaymentModel
    public let displayName: String
    public let roleNames: [String]
    public let timeZone: String

    public init(
        orgId: Int,
        orgName: String,
        parentOrgId: Int?,
        currency: String,
        paymentModel: PaymentModel,
        displayName: String,
        roleNames: [String],
        timeZone: String
    ) {
        self.orgId = orgId
        self.orgName = orgName
        self.parentOrgId = parentOrgId
        self.currency = currency
        self.paymentModel = paymentModel
        self.displayName = displayName
        self.roleNames = roleNames
        self.timeZone = timeZone
    }
}
