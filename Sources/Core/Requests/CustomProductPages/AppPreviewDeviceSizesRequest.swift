struct AppPreviewDeviceSizesRequest: RequestType {
    let path = "/api/v5/creativeappmappings/devices"
    let method = HTTPMethod.get
    let task = RequestTask.plain
}
