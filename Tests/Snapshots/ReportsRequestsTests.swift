import XCTest
import InlineSnapshotTesting
@testable import AppleSearchAds

final class ReportsRequestsTests: SnapshotTestCase {
    func testAdGroupReportRequest() async throws {
        try await assertRequest(AdGroupReportRequest(
            campaignId: 123,
            request: ReportingRequest(
                startTime: "2024-12-31",
                endTime: "2025-01-31",
                timeZone: "UTC",
                granularity: .daily,
                groupBy: [.locality, .gender],
                selector: Selector(
                    conditions: [
                        Condition(field: "adGroupServingStatus", operator: .equals, values: ["RUNNING"]),
                        Condition(field: "adGroupStatus", operator: .contains, values: ["ENABLED", "PAUSED"])
                    ],
                    orderBy: [Sorting(field: "impressions", sortOrder: .ascending)],
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
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345

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
                    "field" : "impressions",
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
                startTime: "2024-12-31",
                endTime: "2025-01-31",
                timeZone: "UTC",
                granularity: .daily,
                groupBy: [.locality, .gender],
                selector: Selector(
                    conditions: [
                        Condition(field: "status", operator: .equals, values: ["VALID"]),
                        Condition(field: "creativeType", operator: .contains, values: [
                            "DEFAULT_PRODUCT_PAGE",
                            "CUSTOM_PRODUCT_PAGE"
                        ])
                    ],
                    orderBy: [Sorting(field: "impressions", sortOrder: .ascending)],
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
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345

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
                    "field" : "impressions",
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
            startTime: "2024-12-31",
            endTime: "2025-01-31",
            timeZone: "UTC",
            granularity: .daily,
            groupBy: [.locality, .gender],
            selector: Selector(
                conditions: [
                    Condition(field: "campaignStatus", operator: .equals, values: ["ENABLED"]),
                    Condition(field: "displayStatus", operator: .contains, values: ["RUNNING", "PAUSED"])
                ],
                orderBy: [Sorting(field: "impressions", sortOrder: .ascending)],
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
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345

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
                    "field" : "impressions",
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
                startTime: "2024-12-31",
                endTime: "2025-01-31",
                timeZone: "UTC",
                granularity: .daily,
                groupBy: [.locality, .gender],
                selector: Selector(
                    conditions: [
                        Condition(field: "keywordStatus", operator: .equals, values: ["ACTIVE"]),
                        Condition(field: "matchType", operator: .contains, values: ["EXACT", "BROAD"])
                    ],
                    orderBy: [Sorting(field: "impressions", sortOrder: .ascending)],
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
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345

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
                    "field" : "impressions",
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
                startTime: "2024-12-31",
                endTime: "2025-01-31",
                timeZone: "UTC",
                granularity: .daily,
                groupBy: [.locality, .gender],
                selector: Selector(
                    conditions: [
                        Condition(field: "keywordStatus", operator: .equals, values: ["ACTIVE"]),
                        Condition(field: "matchType", operator: .contains, values: ["EXACT", "BROAD"])
                    ],
                    orderBy: [Sorting(field: "impressions", sortOrder: .ascending)],
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
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345

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
                    "field" : "impressions",
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
                startTime: "2024-12-31",
                endTime: "2025-01-31",
                timeZone: "UTC",
                granularity: .daily,
                groupBy: [.locality, .gender],
                selector: Selector(
                    conditions: [
                        Condition(field: "keywordStatus", operator: .equals, values: ["ACTIVE"]),
                        Condition(field: "matchType", operator: .contains, values: ["EXACT", "BROAD"])
                    ],
                    orderBy: [Sorting(field: "impressions", sortOrder: .ascending)],
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
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345

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
                    "field" : "impressions",
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
                startTime: "2024-12-31",
                endTime: "2025-01-31",
                timeZone: "UTC",
                granularity: .daily,
                groupBy: [.locality, .gender],
                selector: Selector(
                    conditions: [
                        Condition(field: "keywordStatus", operator: .equals, values: ["ACTIVE"]),
                        Condition(field: "matchType", operator: .contains, values: ["EXACT", "BROAD"])
                    ],
                    orderBy: [Sorting(field: "impressions", sortOrder: .ascending)],
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
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345

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
                    "field" : "impressions",
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
            startTime: "2024-12-31",
            endTime: "2025-01-31",
            dateRange: .last4Weeks,
            granularity: .daily,
            selector: CustomReportSelector(conditions: [
                SovCondition(field: "field 1", operator: .in, values: ["value 1", "value 2"]),
                SovCondition(field: "field 2", operator: .in, values: ["value 3"])
            ])
        ))) {
            """
            POST https://api.searchads.apple.com/api/v5/custom-reports
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345

            {
              "dateRange" : "LAST_4_WEEKS",
              "endTime" : "2025-01-31",
              "granularity" : "DAILY",
              "name" : "My Report",
              "selector" : {
                "conditions" : [
                  {
                    "field" : "field 1",
                    "operator" : "IN",
                    "values" : [
                      "value 1",
                      "value 2"
                    ]
                  },
                  {
                    "field" : "field 2",
                    "operator" : "IN",
                    "values" : [
                      "value 3"
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
            X-AP-Context: orgId=12345
            """
        }
    }

    func testImpressionShareReportListRequest() async throws {
        try await assertRequest(ImpressionShareReportListRequest(
            parameters: ImpressionShareReportListParameters(
                sorting: Sorting(field: "field", sortOrder: .ascending),
                pagination: Pagination(limit: 20, offset: 40)
            )
        )) {
            """
            GET https://api.searchads.apple.com/api/v5/custom-reports?field=field&limit=20&offset=40&sortOrder=ASCENDING
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345
            """
        }
    }
}
