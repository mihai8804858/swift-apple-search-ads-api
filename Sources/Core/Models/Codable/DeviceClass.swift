/// The defined targeted audience to include by device type.
public enum DeviceClass: String, Codable, Hashable, Sendable {
    /// The iPhone device class.
    case iPhone = "IPHONE"
    /// The iPad device class.
    case iPad = "IPAD"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawString = try container.decode(String.self)
        if let deviceClass = DeviceClass(rawValue: rawString.uppercased()) {
            self = deviceClass
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Cannot initialize \(Self.self) from invalid String value \(rawString)"
            )
        }
    }
}
