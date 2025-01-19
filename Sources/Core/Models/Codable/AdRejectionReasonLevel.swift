/// The level at which the system applies an ad rejection reason.
public enum AdRejectionReasonLevel: String, Codable, Hashable, Sendable {
    /// The rejection ReasonLevel applies to a custom product page.
    case customProductPage = "CUSTOM_PRODUCT_PAGE"
    /// The rejection ReasonLevel applies to a custom product page locale.
    case customProductPageLocale = "CUSTOM_PRODUCT_PAGE_LOCALE"
    /// The rejection ReasonLevel applies to a default product page.
    case defaultProductPage = "DEFAULT_PRODUCT_PAGE"
    /// The rejection ReasonLevel applies to a default product page locale.
    case defaultProductPageLocale = "DEFAULT_PRODUCT_PAGE_LOCALE"
}
