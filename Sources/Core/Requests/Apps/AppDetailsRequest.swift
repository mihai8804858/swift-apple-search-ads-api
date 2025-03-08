struct AppDetailsRequest: RequestType {
    let path: String
    let method = HTTPMethod.get

    init(adamId: Int) {
        path = "/api/v5/apps/\(adamId)"
    }
}
