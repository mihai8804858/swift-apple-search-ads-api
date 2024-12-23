import Foundation

struct HeadersInjector: PluginType {
    enum Strategy {
        case append
        case set
    }

    let strategy: Strategy
    let headers: [String: String]

    func prepare(request: inout URLRequest) async throws {
        switch strategy {
        case .append: request.add(headers: headers, replace: false)
        case .set: request.add(headers: headers, replace: true)
        }
    }
}

var defaultHTTPHeaders: [String: String] {
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
