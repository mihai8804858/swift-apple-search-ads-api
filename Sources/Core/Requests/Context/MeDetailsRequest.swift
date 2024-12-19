struct MeDetailsRequest: RequestType {
    let path = "/api/v5/me"
    let method = HTTPMethod.get
    let task = RequestTask.plain
}
