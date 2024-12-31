import XCTest
import InlineSnapshotTesting
@testable import AppleSearchAds

final class ReportsRequestsTests: SnapshotTestCase {
    func testAdGroupReportRequest() async throws {
        try await assertRequest(AdGroupReportRequest(
            campaignId: 123,
            request: ReportingRequest(
                startTime: DateFormatter.yearMonthDay.date(from: "2024-12-31"),
                endTime: DateFormatter.yearMonthDay.date(from: "2025-01-31"),
                timeZone: "UTC",
                granularity: .daily,
                groupBy: [.locality, .gender],
                selector: Selector(
                    conditions: [
                        Condition(field: .adGroupServingStatus, operator: .equals,
                                  value: AdGroup.ServingStatus.running),
                        Condition(field: .adGroupStatus, operator: .contains, values: [
                            AdGroup.Status.enabled,
                            AdGroup.Status.paused
                        ])
                    ],
                    orderBy: [Sorting(field: .cpaGoal, sortOrder: .ascending)],
                    pagination: Pagination(limit: 20, offset: 40)
                ),
                returnGrandTotals: true,
                returnRecordsWithNoMetrics: true,
                returnRowTotals: true
            )
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/reports/campaigns/123/adgroups
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 773
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "endTime" : "2025-01-31",
              "granularity" : "DAILY",
              "groupBy" : [
                "locality",
                "gender"
              ],
              "returnGrandTotals" : true,
              "returnRecordsWithNoMetrics" : true,
              "returnRowTotals" : true,
              "selector" : {
                "conditions" : [
                  {
                    "field" : "adGroupServingStatus",
                    "operator" : "EQUALS",
                    "values" : [
                      "RUNNING"
                    ]
                  },
                  {
                    "field" : "adGroupStatus",
                    "operator" : "CONTAINS",
                    "values" : [
                      "ENABLED",
                      "PAUSED"
                    ]
                  }
                ],
                "orderBy" : [
                  {
                    "field" : "cpaGoal",
                    "sortOrder" : "ASCENDING"
                  }
                ],
                "pagination" : {
                  "limit" : 20,
                  "offset" : 40
                }
              },
              "startTime" : "2024-12-31",
              "timeZone" : "UTC"
            }
            """
        }
    }

    func testAdReportRequest() async throws {
        try await assertRequest(AdReportRequest(
            campaignId: 123,
            request: ReportingRequest(
                startTime: DateFormatter.yearMonthDay.date(from: "2024-12-31"),
                endTime: DateFormatter.yearMonthDay.date(from: "2025-01-31"),
                timeZone: "UTC",
                granularity: .daily,
                groupBy: [.locality, .gender],
                selector: Selector(
                    conditions: [
                        Condition(field: .status, operator: .equals, value: Creative.State.valid),
                        Condition(field: .creativeType, operator: .contains, values: [
                            Creative.Kind.defaultProductPage,
                            Creative.Kind.customProductPage
                        ])
                    ],
                    orderBy: [Sorting(field: .adDisplayStatus, sortOrder: .ascending)],
                    pagination: Pagination(limit: 20, offset: 40)
                ),
                returnGrandTotals: true,
                returnRecordsWithNoMetrics: true,
                returnRowTotals: true
            )
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/reports/campaigns/123/ads
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 790
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "endTime" : "2025-01-31",
              "granularity" : "DAILY",
              "groupBy" : [
                "locality",
                "gender"
              ],
              "returnGrandTotals" : true,
              "returnRecordsWithNoMetrics" : true,
              "returnRowTotals" : true,
              "selector" : {
                "conditions" : [
                  {
                    "field" : "status",
                    "operator" : "EQUALS",
                    "values" : [
                      "VALID"
                    ]
                  },
                  {
                    "field" : "creativeType",
                    "operator" : "CONTAINS",
                    "values" : [
                      "DEFAULT_PRODUCT_PAGE",
                      "CUSTOM_PRODUCT_PAGE"
                    ]
                  }
                ],
                "orderBy" : [
                  {
                    "field" : "adDisplayStatus",
                    "sortOrder" : "ASCENDING"
                  }
                ],
                "pagination" : {
                  "limit" : 20,
                  "offset" : 40
                }
              },
              "startTime" : "2024-12-31",
              "timeZone" : "UTC"
            }
            """
        }
    }

    func testCampaignReportRequest() async throws {
        try await assertRequest(CampaignReportRequest(request: ReportingRequest(
            startTime: DateFormatter.yearMonthDay.date(from: "2024-12-31"),
            endTime: DateFormatter.yearMonthDay.date(from: "2025-01-31"),
            timeZone: "UTC",
            granularity: .daily,
            groupBy: [.locality, .gender],
            selector: Selector(
                conditions: [
                    Condition(field: .campaignStatus, operator: .equals, value: Campaign.Status.enabled),
                    Condition(field: .displayStatus, operator: .contains, values: [
                        Campaign.DisplayStatus.running,
                        Campaign.DisplayStatus.paused
                    ])
                ],
                orderBy: [Sorting(field: .dailyBudget, sortOrder: .ascending)],
                pagination: Pagination(limit: 20, offset: 40)
            ),
            returnGrandTotals: true,
            returnRecordsWithNoMetrics: true,
            returnRowTotals: true
        ))) {
            """
            POST https://api.searchads.apple.com/api/v5/reports/campaigns
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 771
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "endTime" : "2025-01-31",
              "granularity" : "DAILY",
              "groupBy" : [
                "locality",
                "gender"
              ],
              "returnGrandTotals" : true,
              "returnRecordsWithNoMetrics" : true,
              "returnRowTotals" : true,
              "selector" : {
                "conditions" : [
                  {
                    "field" : "campaignStatus",
                    "operator" : "EQUALS",
                    "values" : [
                      "ENABLED"
                    ]
                  },
                  {
                    "field" : "displayStatus",
                    "operator" : "CONTAINS",
                    "values" : [
                      "RUNNING",
                      "PAUSED"
                    ]
                  }
                ],
                "orderBy" : [
                  {
                    "field" : "dailyBudget",
                    "sortOrder" : "ASCENDING"
                  }
                ],
                "pagination" : {
                  "limit" : 20,
                  "offset" : 40
                }
              },
              "startTime" : "2024-12-31",
              "timeZone" : "UTC"
            }
            """
        }
    }

    func testKeywordReportRequest() async throws {
        try await assertRequest(KeywordReportRequest(
            campaignId: 123,
            adGroupId: 456,
            request: ReportingRequest(
                startTime: DateFormatter.yearMonthDay.date(from: "2024-12-31"),
                endTime: DateFormatter.yearMonthDay.date(from: "2025-01-31"),
                timeZone: "UTC",
                granularity: .daily,
                groupBy: [.locality, .gender],
                selector: Selector(
                    conditions: [
                        Condition(field: .keywordStatus, operator: .equals, value: KeywordStatus.active),
                        Condition(field: .matchType, operator: .contains, values: [
                            KeywordMatchType.exact,
                            KeywordMatchType.broad
                        ])
                    ],
                    orderBy: [Sorting(field: .bidAmount, sortOrder: .ascending)],
                    pagination: Pagination(limit: 20, offset: 40)
                ),
                returnGrandTotals: true,
                returnRecordsWithNoMetrics: true,
                returnRowTotals: true
            )
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/reports/campaigns/123/adgroups/456/keywords
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 760
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "endTime" : "2025-01-31",
              "granularity" : "DAILY",
              "groupBy" : [
                "locality",
                "gender"
              ],
              "returnGrandTotals" : true,
              "returnRecordsWithNoMetrics" : true,
              "returnRowTotals" : true,
              "selector" : {
                "conditions" : [
                  {
                    "field" : "keywordStatus",
                    "operator" : "EQUALS",
                    "values" : [
                      "ACTIVE"
                    ]
                  },
                  {
                    "field" : "matchType",
                    "operator" : "CONTAINS",
                    "values" : [
                      "EXACT",
                      "BROAD"
                    ]
                  }
                ],
                "orderBy" : [
                  {
                    "field" : "bidAmount",
                    "sortOrder" : "ASCENDING"
                  }
                ],
                "pagination" : {
                  "limit" : 20,
                  "offset" : 40
                }
              },
              "startTime" : "2024-12-31",
              "timeZone" : "UTC"
            }
            """
        }
    }

    func testKeywordCampaignWideReportRequest() async throws {
        try await assertRequest(KeywordReportRequest(
            campaignId: 123,
            adGroupId: nil,
            request: ReportingRequest(
                startTime: DateFormatter.yearMonthDay.date(from: "2024-12-31"),
                endTime: DateFormatter.yearMonthDay.date(from: "2025-01-31"),
                timeZone: "UTC",
                granularity: .daily,
                groupBy: [.locality, .gender],
                selector: Selector(
                    conditions: [
                        Condition(field: .keywordStatus, operator: .equals, value: KeywordStatus.active),
                        Condition(field: .matchType, operator: .contains, values: [
                            KeywordMatchType.exact,
                            KeywordMatchType.broad
                        ])
                    ],
                    orderBy: [Sorting(field: .bidAmount, sortOrder: .ascending)],
                    pagination: Pagination(limit: 20, offset: 40)
                ),
                returnGrandTotals: true,
                returnRecordsWithNoMetrics: true,
                returnRowTotals: true
            )
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/reports/campaigns/123/keywords
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 760
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "endTime" : "2025-01-31",
              "granularity" : "DAILY",
              "groupBy" : [
                "locality",
                "gender"
              ],
              "returnGrandTotals" : true,
              "returnRecordsWithNoMetrics" : true,
              "returnRowTotals" : true,
              "selector" : {
                "conditions" : [
                  {
                    "field" : "keywordStatus",
                    "operator" : "EQUALS",
                    "values" : [
                      "ACTIVE"
                    ]
                  },
                  {
                    "field" : "matchType",
                    "operator" : "CONTAINS",
                    "values" : [
                      "EXACT",
                      "BROAD"
                    ]
                  }
                ],
                "orderBy" : [
                  {
                    "field" : "bidAmount",
                    "sortOrder" : "ASCENDING"
                  }
                ],
                "pagination" : {
                  "limit" : 20,
                  "offset" : 40
                }
              },
              "startTime" : "2024-12-31",
              "timeZone" : "UTC"
            }
            """
        }
    }

    func testSearchTermReportRequest() async throws {
        try await assertRequest(SearchTermReportRequest(
            campaignId: 123,
            adGroupId: 456,
            request: ReportingRequest(
                startTime: DateFormatter.yearMonthDay.date(from: "2024-12-31"),
                endTime: DateFormatter.yearMonthDay.date(from: "2025-01-31"),
                timeZone: "UTC",
                granularity: .daily,
                groupBy: [.locality, .gender],
                selector: Selector(
                    conditions: [
                        Condition(field: .keywordStatus, operator: .equals, value: KeywordStatus.active),
                        Condition(field: .matchType, operator: .contains, values: [
                            KeywordMatchType.exact,
                            KeywordMatchType.broad
                        ])
                    ],
                    orderBy: [Sorting(field: .bidAmount, sortOrder: .ascending)],
                    pagination: Pagination(limit: 20, offset: 40)
                ),
                returnGrandTotals: true,
                returnRecordsWithNoMetrics: true,
                returnRowTotals: true
            )
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/reports/campaigns/123/adgroups/456/searchterms
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 760
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "endTime" : "2025-01-31",
              "granularity" : "DAILY",
              "groupBy" : [
                "locality",
                "gender"
              ],
              "returnGrandTotals" : true,
              "returnRecordsWithNoMetrics" : true,
              "returnRowTotals" : true,
              "selector" : {
                "conditions" : [
                  {
                    "field" : "keywordStatus",
                    "operator" : "EQUALS",
                    "values" : [
                      "ACTIVE"
                    ]
                  },
                  {
                    "field" : "matchType",
                    "operator" : "CONTAINS",
                    "values" : [
                      "EXACT",
                      "BROAD"
                    ]
                  }
                ],
                "orderBy" : [
                  {
                    "field" : "bidAmount",
                    "sortOrder" : "ASCENDING"
                  }
                ],
                "pagination" : {
                  "limit" : 20,
                  "offset" : 40
                }
              },
              "startTime" : "2024-12-31",
              "timeZone" : "UTC"
            }
            """
        }
    }

    func testSearchTermCampaignWideReportRequest() async throws {
        try await assertRequest(SearchTermReportRequest(
            campaignId: 123,
            adGroupId: nil,
            request: ReportingRequest(
                startTime: DateFormatter.yearMonthDay.date(from: "2024-12-31"),
                endTime: DateFormatter.yearMonthDay.date(from: "2025-01-31"),
                timeZone: "UTC",
                granularity: .daily,
                groupBy: [.locality, .gender],
                selector: Selector(
                    conditions: [
                        Condition(field: .keywordStatus, operator: .equals, value: KeywordStatus.active),
                        Condition(field: .matchType, operator: .contains, values: [
                            KeywordMatchType.exact,
                            KeywordMatchType.broad
                        ])
                    ],
                    orderBy: [Sorting(field: .bidAmount, sortOrder: .ascending)],
                    pagination: Pagination(limit: 20, offset: 40)
                ),
                returnGrandTotals: true,
                returnRecordsWithNoMetrics: true,
                returnRowTotals: true
            )
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/reports/campaigns/123/searchterms
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 760
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "endTime" : "2025-01-31",
              "granularity" : "DAILY",
              "groupBy" : [
                "locality",
                "gender"
              ],
              "returnGrandTotals" : true,
              "returnRecordsWithNoMetrics" : true,
              "returnRowTotals" : true,
              "selector" : {
                "conditions" : [
                  {
                    "field" : "keywordStatus",
                    "operator" : "EQUALS",
                    "values" : [
                      "ACTIVE"
                    ]
                  },
                  {
                    "field" : "matchType",
                    "operator" : "CONTAINS",
                    "values" : [
                      "EXACT",
                      "BROAD"
                    ]
                  }
                ],
                "orderBy" : [
                  {
                    "field" : "bidAmount",
                    "sortOrder" : "ASCENDING"
                  }
                ],
                "pagination" : {
                  "limit" : 20,
                  "offset" : 40
                }
              },
              "startTime" : "2024-12-31",
              "timeZone" : "UTC"
            }
            """
        }
    }

    func testImpressionShareReportCreateRequest() async throws {
        try await assertRequest(ImpressionShareReportCreateRequest(request: CustomReportRequest(
            name: "My Report",
            startTime: DateFormatter.yearMonthDay.date(from: "2024-12-31"),
            endTime: DateFormatter.yearMonthDay.date(from: "2025-01-31"),
            dateRange: .last4Weeks,
            granularity: .daily,
            selector: CustomReportSelector(conditions: [
                SovCondition(field: .granularity, operator: .in, values: [
                    CustomReportGranularity.daily,
                    CustomReportGranularity.weekly
                ]),
                SovCondition(field: .dimensions, operator: .in, values: [
                    CustomReport.Metric.searchPopularity,
                    CustomReport.Metric.rank
                ])
            ])
        ))) {
            """
            POST https://api.searchads.apple.com/api/v5/custom-reports
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 491
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "dateRange" : "LAST_4_WEEKS",
              "endTime" : "2025-01-31",
              "granularity" : "DAILY",
              "name" : "My Report",
              "selector" : {
                "conditions" : [
                  {
                    "field" : "granularity",
                    "operator" : "IN",
                    "values" : [
                      "DAILY",
                      "WEEKLY"
                    ]
                  },
                  {
                    "field" : "dimensions",
                    "operator" : "IN",
                    "values" : [
                      "searchPopularity",
                      "rank"
                    ]
                  }
                ]
              },
              "startTime" : "2024-12-31"
            }
            """
        }
    }

    func testImpressionShareReportGetRequest() async throws {
        try await assertRequest(ImpressionShareReportRequest(reportId: 123)) {
            """
            GET https://api.searchads.apple.com/api/v5/custom-reports/123
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testImpressionShareReportListRequest() async throws {
        try await assertRequest(ImpressionShareReportListRequest(
            parameters: ImpressionShareReportListParameters(
                sorting: Sorting(field: .endTime, sortOrder: .ascending),
                pagination: Pagination(limit: 20, offset: 40)
            )
        )) {
            """
            GET https://api.searchads.apple.com/api/v5/custom-reports?field=endTime&limit=20&offset=40&sortOrder=ASCENDING
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }
}
