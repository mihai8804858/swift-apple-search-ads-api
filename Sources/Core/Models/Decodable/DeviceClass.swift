/// The defined targeted audience to include by device type.
public enum DeviceClass: String, Decodable, Equatable, Sendable {
    /// The iPhone device class.
    case iPhone = "IPHONE"
    /// The iPad device class.
    case iPad = "IPAD"
}