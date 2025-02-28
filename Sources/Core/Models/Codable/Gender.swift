/// The defined targeted audience in a campaign.
public enum Gender: String, Codable, Hashable, Sendable {
    /// Male.
    case male = "M"
    /// Female.
    case female = "F"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawString = try container.decode(String.self)
        if let gender = Gender(rawValue: rawString.uppercased()) {
            self = gender
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Cannot initialize \(Self.self) from invalid String value \(rawString)"
            )
        }
    }
}
