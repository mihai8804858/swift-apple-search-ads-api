struct URLParameters: @unchecked Sendable {
    let parameters: [String: Any]

    init(_ parameters: [String: Any]) {
        self.parameters = parameters
    }
}
