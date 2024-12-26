import Foundation

struct AcceptHeadersInjector: PluginType {
    private let headers: [String: String]

    init(preferredLanguages: [String] = Locale.preferredLanguages) {
        headers = [
            "Accept-Encoding": "gzip;q=1.0, compress;q=0.5",
            "Accept-Language": preferredLanguages.prefix(6).enumerated().map { index, languageCode in
                let quality = 1.0 - (Double(index) * 0.1)
                return "\(languageCode);q=\(quality)"
            }.joined(separator: ", ")
        ]
    }

    func prepare(request: inout URLRequest) async throws {
        request.add(headers: headers, replace: true)
    }
}
