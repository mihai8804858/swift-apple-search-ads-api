/// The response to a request to fetch details for a monthly invoicing payment model.
public struct LOCInvoiceDetails: Decodable, Equatable, Sendable {
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

    /// Create an instance of `LOCInvoiceDetails`.
    ///
    /// - Parameters:
    ///     - billingContactEmail: A valid email address for the LOC billing contact.
    ///     - buyerEmail: A valid email address for the LOC buyer.
    ///     - buyerName: A valid LOC buyer name.
    ///     - clientName: An advertiser or product. Required for agency-type accounts.
    ///     - orderNumber: A purchase order number. Required for agency-type accounts.
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
