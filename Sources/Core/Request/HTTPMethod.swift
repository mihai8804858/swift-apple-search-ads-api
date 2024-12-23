struct HTTPMethod: RawRepresentable, Equatable, Sendable {
    let rawValue: String

    static let get = HTTPMethod(rawValue: "GET")
    static let put = HTTPMethod(rawValue: "PUT")
    static let post = HTTPMethod(rawValue: "POST")
    static let delete = HTTPMethod(rawValue: "DELETE")
}
