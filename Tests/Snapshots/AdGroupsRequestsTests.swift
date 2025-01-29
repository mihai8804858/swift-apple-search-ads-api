import XCTest
import InlineSnapshotTesting
@testable import AppleSearchAds

final class AdGroupsRequestsTests: SnapshotTestCase {
    func testCreateRequest() async throws {
        try await assertRequest(AdGroupCreateRequest(
            campaignId: 123,
            adGroup: AdGroup(
                id: 456,
                orgId: 789,
                campaignId: 123,
                status: .enabled,
                servingStatus: .notRunning,
                servingStateReasons: [
                    .appNotSupport,
                    .adGroupPausedByUser
                ],
                displayStatus: .paused,
                name: "My Ad Group",
                pricingModel: .cpc,
                paymentModel: .payAsYouGo,
                defaultBidAmount: Money(amount: "1", currency: "USD"),
                cpaGoal: Money(amount: "5", currency: "USD"),
                deleted: false,
                automatedKeywordsOptIn: true,
                modificationTime: Date(timeIntervalSince1970: 1_500_000),
                startTime: Date(timeIntervalSince1970: 1_000_000),
                endTime: Date(timeIntervalSince1970: 2_000_000),
                targetingDimensions: TargetingDimensions(
                    age: AgeCriteria(
                        included: [AgeRange(minAge: 18, maxAge: 30)],
                        excluded: [AgeRange(minAge: 24, maxAge: 26)]
                    ),
                    gender: GenderCriteria(included: [.female], excluded: [.male]),
                    appCategories: AppCategoryCriteria(included: [13579], excluded: [2468]),
                    appDownloaders: AppDownloaderCriteria(included: ["2468"], excluded: ["13579"]),
                    country: CountryCriteria(included: ["US"], excluded: ["GB"]),
                    adminArea: AdminAreaCriteria(included: ["California"], excluded: ["New York"]),
                    locality: LocalityCriteria(included: ["San Jose"], excluded: ["San Francisco"]),
                    daypart: DaypartCriteria(userTime: DaypartDetail(included: [10], excluded: [20])),
                    deviceClass: DeviceClassCriteria(included: [.iPhone], excluded: [.iPad])
                )
            )
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/campaigns/123/adgroups
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 1863
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "automatedKeywordsOptIn" : true,
              "campaignId" : 123,
              "cpaGoal" : {
                "amount" : "5",
                "currency" : "USD"
              },
              "defaultBidAmount" : {
                "amount" : "1",
                "currency" : "USD"
              },
              "deleted" : false,
              "displayStatus" : "PAUSED",
              "endTime" : "1970-01-24T03:33:20.000",
              "id" : 456,
              "modificationTime" : "1970-01-18T08:40:00.000",
              "name" : "My Ad Group",
              "orgId" : 789,
              "paymentModel" : "PAYG",
              "pricingModel" : "CPC",
              "servingStateReasons" : [
                "APP_NOT_SUPPORT",
                "AD_GROUP_PAUSED_BY_USER"
              ],
              "servingStatus" : "NOT_RUNNING",
              "startTime" : "1970-01-12T13:46:40.000",
              "status" : "ENABLED",
              "targetingDimensions" : {
                "adminArea" : {
                  "excluded" : [
                    "New York"
                  ],
                  "included" : [
                    "California"
                  ]
                },
                "age" : {
                  "excluded" : [
                    {
                      "maxAge" : 26,
                      "minAge" : 24
                    }
                  ],
                  "included" : [
                    {
                      "maxAge" : 30,
                      "minAge" : 18
                    }
                  ]
                },
                "appCategories" : {
                  "excluded" : [
                    2468
                  ],
                  "included" : [
                    13579
                  ]
                },
                "appDownloaders" : {
                  "excluded" : [
                    "13579"
                  ],
                  "included" : [
                    "2468"
                  ]
                },
                "country" : {
                  "excluded" : [
                    "GB"
                  ],
                  "included" : [
                    "US"
                  ]
                },
                "daypart" : {
                  "userTime" : {
                    "excluded" : [
                      20
                    ],
                    "included" : [
                      10
                    ]
                  }
                },
                "deviceClass" : {
                  "excluded" : [
                    "IPAD"
                  ],
                  "included" : [
                    "IPHONE"
                  ]
                },
                "gender" : {
                  "excluded" : [
                    "M"
                  ],
                  "included" : [
                    "F"
                  ]
                },
                "locality" : {
                  "excluded" : [
                    "San Francisco"
                  ],
                  "included" : [
                    "San Jose"
                  ]
                }
              }
            }
            """
        }
    }

    func testDeleteRequest() async throws {
        try await assertRequest(AdGroupDeleteRequest(campaignId: 12345, adGroupId: 67890)) {
            """
            DELETE https://api.searchads.apple.com/api/v5/campaigns/12345/adgroups/67890
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testFindRequest() async throws {
        try await assertRequest(AdGroupFindRequest(
            campaignId: 12345,
            selector: Selector(
                conditions: [
                    Condition(field: .status, operator: .equals, value: AdGroup.Status.enabled),
                    Condition(field: .name, operator: .contains, value: "Latest")
                ],
                fields: [.campaignId, .cpaGoal],
                orderBy: [Sorting(field: .displayStatus, sortOrder: .ascending)],
                pagination: Pagination(limit: 20, offset: 40)
            )
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/campaigns/12345/adgroups/find
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 460
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "conditions" : [
                {
                  "field" : "status",
                  "operator" : "EQUALS",
                  "values" : [
                    "ENABLED"
                  ]
                },
                {
                  "field" : "name",
                  "operator" : "CONTAINS",
                  "values" : [
                    "Latest"
                  ]
                }
              ],
              "fields" : [
                "campaignId",
                "cpaGoal"
              ],
              "orderBy" : [
                {
                  "field" : "displayStatus",
                  "sortOrder" : "ASCENDING"
                }
              ],
              "pagination" : {
                "limit" : 20,
                "offset" : 40
              }
            }
            """
        }
    }

    func testFindOrgWideRequest() async throws {
        try await assertRequest(AdGroupFindRequest(campaignId: nil, selector: nil)) {
            """
            POST https://api.searchads.apple.com/api/v5/adgroups/find
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 4
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {

            }
            """
        }
    }

    func testListRequest() async throws {
        try await assertRequest(AdGroupListRequest(campaignId: 12345, pagination: Pagination(limit: 20, offset: 40))) {
            """
            GET https://api.searchads.apple.com/api/v5/campaigns/12345/adgroups?limit=20&offset=40
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testGetRequest() async throws {
        try await assertRequest(AdGroupRequest(campaignId: 12345, adGroupId: 67890)) {
            """
            GET https://api.searchads.apple.com/api/v5/campaigns/12345/adgroups/67890
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testUpdateRequest() async throws {
        try await assertRequest(AdGroupUpdateRequest(
            campaignId: 12345,
            adGroupId: 67890,
            adGroup: AdGroupUpdate(
                status: .paused,
                name: "My Campaign Ad Group",
                defaultBidAmount: Money(amount: "2", currency: "USD"),
                cpaGoal: Money(amount: "10", currency: "USD"),
                automatedKeywordsOptIn: false,
                startTime: Date(timeIntervalSince1970: 1_000_000),
                endTime: Date(timeIntervalSince1970: 2_000_000),
                targetingDimensions: TargetingDimensions(
                    age: AgeCriteria(
                        included: [AgeRange(minAge: 18, maxAge: 30)],
                        excluded: [AgeRange(minAge: 24, maxAge: 26)]
                    ),
                    gender: GenderCriteria(included: [.female], excluded: [.male]),
                    appCategories: AppCategoryCriteria(included: [13579], excluded: [2468]),
                    appDownloaders: AppDownloaderCriteria(included: ["2468"], excluded: ["13579"]),
                    country: CountryCriteria(included: ["US"], excluded: ["GB"]),
                    adminArea: AdminAreaCriteria(included: ["California"], excluded: ["New York"]),
                    locality: LocalityCriteria(included: ["San Jose"], excluded: ["San Francisco"]),
                    daypart: DaypartCriteria(userTime: DaypartDetail(included: [10], excluded: [20])),
                    deviceClass: DeviceClassCriteria(included: [.iPhone], excluded: [.iPad])
                )
            )
        )) {
            """
            PUT https://api.searchads.apple.com/api/v5/campaigns/12345/adgroups/67890
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 1545
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "automatedKeywordsOptIn" : false,
              "cpaGoal" : {
                "amount" : "10",
                "currency" : "USD"
              },
              "defaultBidAmount" : {
                "amount" : "2",
                "currency" : "USD"
              },
              "endTime" : "1970-01-24T03:33:20.000",
              "name" : "My Campaign Ad Group",
              "startTime" : "1970-01-12T13:46:40.000",
              "status" : "PAUSED",
              "targetingDimensions" : {
                "adminArea" : {
                  "excluded" : [
                    "New York"
                  ],
                  "included" : [
                    "California"
                  ]
                },
                "age" : {
                  "excluded" : [
                    {
                      "maxAge" : 26,
                      "minAge" : 24
                    }
                  ],
                  "included" : [
                    {
                      "maxAge" : 30,
                      "minAge" : 18
                    }
                  ]
                },
                "appCategories" : {
                  "excluded" : [
                    2468
                  ],
                  "included" : [
                    13579
                  ]
                },
                "appDownloaders" : {
                  "excluded" : [
                    "13579"
                  ],
                  "included" : [
                    "2468"
                  ]
                },
                "country" : {
                  "excluded" : [
                    "GB"
                  ],
                  "included" : [
                    "US"
                  ]
                },
                "daypart" : {
                  "userTime" : {
                    "excluded" : [
                      20
                    ],
                    "included" : [
                      10
                    ]
                  }
                },
                "deviceClass" : {
                  "excluded" : [
                    "IPAD"
                  ],
                  "included" : [
                    "IPHONE"
                  ]
                },
                "gender" : {
                  "excluded" : [
                    "M"
                  ],
                  "included" : [
                    "F"
                  ]
                },
                "locality" : {
                  "excluded" : [
                    "San Francisco"
                  ],
                  "included" : [
                    "San Jose"
                  ]
                }
              }
            }
            """
        }
    }
}
