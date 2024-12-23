import Foundation

struct AcceptHeadersInjector: PluginType {
    private let headers = acceptHeaders

    func prepare(request: inout URLRequest) async throws {
        request.add(headers: headers, replace: true)
    }
}

private var acceptHeaders: [String: String] {
    [
        "Accept-Encoding": acceptEncoding,
        "Accept-Language": acceptLanguage
    ]
}

private var acceptEncoding: String {
    "gzip;q=1.0, compress;q=0.5"
}

private var acceptLanguage: String {
    Locale.preferredLanguages.prefix(6).enumerated().map { index, languageCode in
        let quality = 1.0 - (Double(index) * 0.1)
        return "\(languageCode);q=\(quality)"
    }.joined(separator: ", ")
}
