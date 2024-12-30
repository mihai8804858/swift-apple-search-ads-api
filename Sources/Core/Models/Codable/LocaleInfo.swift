/// The supported languages and language codes.
public struct LocaleInfo: Codable, Equatable, Sendable {
    /// The language associated with the ISO 3166-1 alpha-2 country code, such as US.
    public let language: String?
    /// The ISO 639-1 language code appended to the ISO 3166-1 alpha-2 country code, such as en-US.
    public let languageCode: String?

    public init(language: String? = nil, languageCode: String? = nil) {
        self.language = language
        self.languageCode = languageCode
    }
}
