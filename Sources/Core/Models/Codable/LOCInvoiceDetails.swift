/// The response to a request to fetch details for a monthly invoicing payment model.
public struct LOCInvoiceDetails: Codable, Equatable, Sendable {
    /// A valid email address for the LOC billing contact.
    public let billingContactEmail: String
    /// A valid email address for the LOC buyer.
    public let buyerEmail: String
    /// A valid LOC buyer name.
    public let buyerName: String
    /// An advertiser or product. Required for agency-type accounts.
    public let clientName: String
    /// A purchase order number. Required for agency-type accounts.
    public let orderNumber: String

    public init(
        billingContactEmail: String,
        buyerEmail: String,
        buyerName: String,
        clientName: String,
        orderNumber: String
    ) {
        self.billingContactEmail = billingContactEmail
        self.buyerEmail = buyerEmail
        self.buyerName = buyerName
        self.clientName = clientName
        self.orderNumber = orderNumber
    }
}
