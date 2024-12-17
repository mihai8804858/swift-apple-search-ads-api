public enum PaymentModel: String, Decodable, Sendable {
    case payAsYouGo = "PAYG"
    case lineOfCredit = "LOC"
    case unknown = ""
}
