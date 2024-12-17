struct AccessTokenRequest: RequestType {
    let path = "/auth/oauth2/token"
    let method = HTTPMethod.post
    let task: RequestTask

    init(clientIdentifier: String, clientSecret: String) {
        task = .parameterized(EncodedParameters(
            encoding: URLEncoding.queryString,
            parameters: URLParameters([
                "grant_type": "client_credentials",
                "scope": "searchadsorg",
                "client_id": clientIdentifier,
                "client_secret": clientSecret
            ])
        ))
    }
}
