struct AccessTokenParameters: Hashable, Encodable, Sendable {
    enum CodingKeys: String, CodingKey {
        case scope
        case grantType = "grant_type"
        case clientID = "client_id"
        case clientSecret = "client_secret"
    }

    let scope = "searchadsorg"
    let grantType = "client_credentials"
    let clientID: String
    let clientSecret: String
}

struct AccessTokenRequest: RequestType {
    let path = "/auth/oauth2/token"
    let method = HTTPMethod.post
    let query: RequestQuery?

    init(parameters: AccessTokenParameters) {
        query = RequestQuery(parameters)
    }
}
