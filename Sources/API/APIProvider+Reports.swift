public extension APIProvider {
    /// Fetches reports for campaigns.
    ///
    /// - Parameters:
    ///     - request: The report request body consisting of metrics and dimensions to use as filters.
    ///     - decoding: Custom model to decode when filtering the returned fields using
    ///     `ReportingRequest.selector.fields` property. Omit this if no fields are being filtered out,
    ///     which will result in decoding `ReportingCampaign` type.
    ///
    /// - Returns: An object of type `Reporting<Empty, Model>`.
    ///
    /// - Throws: An error of type `APIError`.
    ///
    /// Use this endpoint to fetch reports for your campaigns.
    /// See `ReportingCampaign` and `CampaignAppDetail` for `Condition` operators
    /// and field values to filter results with a `Selector`.
    /// See the `groupBy` parameter description in the `ReportingRequest` for supported values per targeting dimension.
    /// The `orderBy` selector specifies fields to sort the records list by `ASCENDING` or `DESCENDING`.
    /// All `ReportingCampaign` fields are available to the `orderBy` selector
    /// except `servingStateReasons`, `app`, `app:{appName}`, and `app:{adamId}`.
    func getCampaignsReport<Model: Decodable & Sendable>(
        request: ReportingRequest<ReportingCampaign>,
        decoding: Model.Type = ReportingCampaign.self
    ) async throws -> Response<Reporting<Empty, Model>> {
        try await provider.requestDataModel(from: CampaignReportRequest(request: request))
    }

    /// Fetches reports for ad groups within a campaign.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - request: The report request body consisting of metrics and dimensions to use as filters.
    ///     - decoding: Custom model to decode when filtering the returned fields using
    ///     `ReportingRequest.selector.fields` property. Omit this if no fields are being filtered out,
    ///     which will result in decoding `ReportingAdGroup` type.
    ///
    /// - Returns: An object of type `Reporting<Empty, Model>`.
    ///
    /// - Throws: An error of type `APIError`.
    ///
    /// Use this endpoint to fetch reports for your ad groups in campaigns.
    /// See `ReportingAdGroup` for `Condition` operators and field values to filter results with an object `Selector`.
    /// See the `groupBy` parameter description in the `ReportingRequest` for supported values per targeting dimension.
    /// The `orderBy` selector specifies fields to sort the records list by `ASCENDING` or `DESCENDING`.
    /// All `ReportingAdGroup` fields are available to the `orderBy` selector except `adGroupServingStateReasons`.
    func getAdGroupsReport<Model: Decodable & Sendable>(
        campaignId: Int,
        request: ReportingRequest<ReportingAdGroup>,
        decoding: Model.Type = ReportingAdGroup.self
    ) async throws -> Response<Reporting<Empty, Model>> {
        try await provider.requestDataModel(from: AdGroupReportRequest(campaignId: campaignId, request: request))
    }

    /// Fetches reports for targeting keywords within a campaign and / or ad group.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - request: The report request body consisting of metrics and dimensions to use as filters.
    ///     - decoding: Custom model to decode when filtering the returned fields using
    ///     `ReportingRequest.selector.fields` property. Omit this if no fields are being filtered out,
    ///     which will result in decoding `ReportingKeyword` type.
    ///
    /// - Returns: An object of type `Reporting<KeywordInsights, Model>`.
    ///
    /// - Throws: An error of type `APIError`.
    ///
    /// Use this endpoint to fetch reports for a high volume of targeting keywords in your campaigns.
    /// See `ReportingKeyword` for `Condition` operators and field values to filter results with a `Selector`.
    /// The `orderBy` selector specifies fields to sort the records list by `ASCENDING` or `DESCENDING`.
    /// All `ReportingKeyword` fields are available to the `orderBy` selector.
    func getKeywordsReport<Model: Decodable & Sendable>(
        campaignId: Int,
        adGroupId: Int? = nil,
        request: ReportingRequest<ReportingKeyword>,
        decoding: Model.Type = ReportingKeyword.self
    ) async throws -> Response<Reporting<KeywordInsights, Model>> {
        try await provider.requestDataModel(from: KeywordReportRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            request: request
        ))
    }

    /// Fetches reports for search terms within a campaign and / or ad group.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - request: The report request body consisting of metrics and dimensions to use as filters.
    ///     - decoding: Custom model to decode when filtering the returned fields using
    ///     `ReportingRequest.selector.fields` property. Omit this if no fields are being filtered out,
    ///     which will result in decoding `ReportingSearchTerm` type.
    ///
    /// - Returns: An object of type `Reporting<Empty, Model>`.
    ///
    /// - Throws: An error of type `APIError`.
    ///
    /// Use this endpoint to fetch reports with a high volume of search terms in your campaign.
    /// See `ReportingSearchTerm` for `Condition` operators and field values to filter results with a `Selector`.
    /// The limit for search term-level reports is 10 impressions.
    /// Search term-level reports only support a `timeZone` value of `ORTZ`.
    /// The `orderBy` selector specifies fields to sort the records list by `ASCENDING` or `DESCENDING`.
    /// All `ReportingSearchTerm` fields are available to the `orderBy` selector.
    func getSearchTermsReport<Model: Decodable & Sendable>(
        campaignId: Int,
        adGroupId: Int? = nil,
        request: ReportingRequest<ReportingSearchTerm>,
        decoding: Model.Type = ReportingSearchTerm.self
    ) async throws -> Response<Reporting<Empty, Model>> {
        try await provider.requestDataModel(from: SearchTermReportRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            request: request
        ))
    }

    /// Fetches ad performance data within a campaign.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - request: The report request body consisting of metrics and dimensions to use as filters.
    ///     - decoding: Custom model to decode when filtering the returned fields using
    ///     `ReportingRequest.selector.fields` property. Omit this if no fields are being filtered out,
    ///     which will result in decoding `ReportingAd` type.
    ///
    /// - Returns: An object of type `Reporting<Empty, Model>`.
    ///
    /// - Throws: An error of type `APIError`.
    ///
    /// Use this endpoint to return performance data for ads within your campaigns.
    /// The `orderBy` Selector is required in ad-level report requests.
    /// To filter results, use selector `Condition` operators and field values that the `ReportingAd` object specifies.
    /// You can only perform `GroupBy` on the `countryOrRegion` field.
    /// You can map your campaign installations by `adId` through the `AdServices` attribution framework.
    func getAdReport<Model: Decodable & Sendable>(
        campaignId: Int,
        request: ReportingRequest<ReportingAd>,
        decoding: Model.Type = ReportingAd.self
    ) async throws -> Response<Reporting<Empty, Model>> {
        try await provider.requestDataModel(from: AdReportRequest(campaignId: campaignId, request: request))
    }

    /// Obtain a report ID.
    ///
    /// - Parameters:
    ///     - request: The impression share report request body, consisting of metrics and dimensions to filter on.
    ///
    /// - Returns: An object of type `CustomReport`.
    ///
    /// - Throws: An error of type `APIError`.
    ///
    /// Use this endpoint to obtain a `reportId` to use in a Get a Single Impression Share Report request.
    /// This endpoint supports selectors.
    /// - You can generate up to 10 reports within 24 hours.
    /// - You can create reports for a range of up to 30 days for any time period after 2020-04-12.
    /// - You can’t edit or remove report fields.
    /// - Impression Share reports with a `WEEKLY` granularity value can’t have custom `startTime` and `endTime`
    /// in the request payload. Use `dateRange` instead.
    func createImpressionShareReport(request: CustomReportRequest) async throws -> Response<CustomReport> {
        try await provider.requestDataModel(from: ImpressionShareReportCreateRequest(request: request))
    }

    /// Fetches a single Impression Share report containing metrics and metadata.
    ///
    /// - Parameters:
    ///     - reportId: The unique identifier for the report.
    ///
    /// - Returns: An object of type `CustomReport`.
    ///
    /// - Throws: An error of type `APIError`.
    func getImpressionShareReport(reportId: Int) async throws -> Response<CustomReport> {
        try await provider.requestDataModel(from: ImpressionShareReportRequest(reportId: reportId))
    }

    /// Fetches all Impression Share reports containing metrics and metadata.
    ///
    /// - Parameters:
    ///     - parameters: Impression share report list parameters.
    ///
    /// - Returns: A paginated list of `CustomReport`.
    ///
    /// - Throws: An error of type `APIError`.
    ///
    /// Use this endpoint to return all Impression Share reports containing metrics and metadata.
    /// The rate limit for this endpoint is 150 reports within 15 minutes.
    func listImpressionShareReports(
        parameters: ImpressionShareReportListParameters
    ) async throws -> Response<Paginated<CustomReport>> {
        try await provider.requestPaginatedModel(from: ImpressionShareReportListRequest(parameters: parameters))
    }
}
