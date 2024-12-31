# AppleSearchAds

`AppleSearchAds` is a framework that enables working with the [Apple Search Ads API](https://developer.apple.com/documentation/apple_search_ads) from Apple.

[![CI](https://github.com/mihai8804858/swift-apple-search-ads-api/actions/workflows/ci.yml/badge.svg)](https://github.com/mihai8804858/swift-apple-search-ads-api/actions/workflows/ci.yml)

## Installation

You can add `swift-apple-search-ads-api` to an Xcode project by adding it to your project as a package.

> https://github.com/mihai8804858/swift-apple-search-ads-api

If you want to use `swift-apple-search-ads-api` in a [SwiftPM](https://swift.org/package-manager/) project, it's as simple as adding it to your `Package.swift`:

``` swift
dependencies: [
    .package(url: "https://github.com/mihai8804858/swift-apple-search-ads-api", branch: "main")
]
```

And then adding the product to any target that needs access to the library:

```swift
.product(name: "AppleSearchAds", package: "swift-apple-search-ads-api")
```

## Getting Started

See [Implementing OAuth for the Apple Search Ads API](https://developer.apple.com/documentation/apple_search_ads/implementing_oauth_for_the_apple_search_ads_api) for how the authentication process works.

### Invite Users

Access to the API is done through API users. Account administrators invite users with API permissions using the following process:
* From the [Apple Search Ads UI](https://searchads.apple.com), choose `Sign In` > `Advanced` and log in as an account administrator.
* From the `Users` menu in the top-right corner, select the account to invite users to.
* Choose `Account Settings` > `User Management`.
* Click `Invite Users` to invite users to your Apple Search Ads organization.
* In the `User Details` section, enter the user’s first name, last name, and Apple ID.
* In the `User Access and Role` section, select an API user role. For non-API roles, see [Invite users to your account](https://searchads.apple.com/help/get-started/0011-invite-users-to-your-account).
* Click Send Invite. The invited user receives an email with a secure code. The user signs into the secure Apple URL in the email and inputs the provided code, which activates the user’s account.

### Generate a Private Key

API users need to create a private key. If you’re using MacOS or a UNIX-like operating system, `OpenSSL` works natively. If you’re on a Windows platform, you need to download `OpenSSL`.
```bash
openssl ecparam -genkey -name prime256v1 -noout -out private-key.pem
```
The generated `private-key.pem` file resembles the following example:
```
-----BEGIN EC PRIVATE KEY-----
MHcCAQEEIKtnxllRY8nbndBQwT9we4pEULtjpW605iwvzLlKcBq4oAoGCCqGSM49
AwEHoUQDQgAEY58v74eQFyLtu5rtCpeU4NggVSUQSOcHhN744t0gWGc/xXkCSusz
LaZriCQnnqq4Vx+IscLFcrjBj+ulZzKlUQ==
-----END EC PRIVATE KEY-----
```

> [!IMPORTANT]
> Always keep your private key secure and never share it. If your private key becomes compromised, you need to re-create a private key and client secret, and reupload it to your [Apple Search Ads](https://searchads.apple.com) account.

### Extract a Public Key

Use the following command to extract a public key from your persisted private key:
```bash
openssl ec -in private-key.pem -pubout -out public-key.pem
```
Open the `public-key.pem` file in a text editor and copy the public key, including the begin and end lines.

### Upload a Public Key

Follow these steps to upload your public key:
* From the Search Ads UI, choose `Account Settings` > `API`. Paste the key created in the above section into the `Public Key` field.
* Click Save. A group of credentials displays as a code block above the public key field. Make not of your `clientId`, `teamId`, and `keyId`.
```
clientId SEARCHADS.aeb3ef5f-0c5a-4f2a-99c8-fca83f25a9
teamId SEARCHADS.hgw3ef3p-0w7a-8a2n-77c8-scv83f25a7
keyId a273d0d3-4d9e-458c-a173-0db8619ca7d7
```

## Usage

### Import SDK

```swift
import AppleSearchAds
```

### Create API configuration

You'll need the client id, team id, key id and private key to create an API configuration.

Open the private key in a text editor and copy the contents between `-----BEGIN EC PRIVATE KEY-----` and `-----END EC PRIVATE KEY-----`, also remove any newlines from the contents.

Create the configuration using the private key:
```swift
let configuration = try APIConfiguration(
  clientIdentifier: "<CLIENT-ID>",
  teamIdentifier: "<TEAM-ID>",
  keyIdentifier: "<KEY-ID>",
  privateKey: "PRIVATE-KEY"
)
```

It's also possible to create the API configuration using the file URL to the private key:
```swift
let configuration = try APIConfiguration(
  clientIdentifier: "<CLIENT-ID>",
  teamIdentifier: "<TEAM-ID>",
  keyIdentifier: "<KEY-ID>",
  privateKeyURL: URL(string: "<PRIVATE-KEY-URL>")!
)
```

The initializer also accepts an optional `jwtExpirationDuration` parameter which defines the JWT expiration duration, which defaults to 1 day. The max allowed value is 180 days.
```swift
let configuration = try APIConfiguration(
  clientIdentifier: "<CLIENT-ID>",
  teamIdentifier: "<TEAM-ID>",
  keyIdentifier: "<KEY-ID>",
  privateKey: "PRIVATE-KEY",
  jwtExpirationDuration: 86400 * 7 // 7 days
)
```

### Create API provider

```swift
let provider = APIProvider(configuration: configuration)
```

### Perform Requests

```swift
let campaigns = try await provider.listCampaigns()
```

## Partial Fetch

A partial fetch indicates which properties to return in a response when fetching data. Use a partial fetch where a [Selector](https://developer.apple.com/documentation/apple_search_ads/selector) is available by using optional field parameters to limit the fields within each record that returns. For example, you can choose to only return the `id` and `name` for each campaign.

> [!IMPORTANT]
> As the partial fetch limits the fields returned, you should create your own decodable types given the fields you're filtering, and use those types with the `Selector`.

```swift
struct MyCampaignModel: Decodable, Sendable {
  let id: Int
  let name: String
}

let campaigns = try await provider.findCampaigns(
  selector: Selector(fields: ["id", "name"]),
  decoding: MyCampaignModel.self
)
```

This will perform the following `GET` request:
```
GET https://api.searchads.apple.com/api/v5/campaigns?fields=id,name
```

Which will result in the following response:
```json
{
    "data": [
        {
            "id": 542370539,
            "name": "Campaign example 1"
        },
        {
            "id": 542370549,
            "name": "Campaign example 2"
        }
    ],
    "pagination": {
        "totalResults": 2,
        "startIndex": 0,
        "itemsPerPage": 20
    },
    "error": null
}
```

## Rate Limits

Rate limits exist in the Apple Search Ads Campaign Management API to avoid latency and other system problems from too many API calls within a limited time. For API users that are using automated retry logic in their environments, Apple’s solution is to require the retry logic to increase retry attempts exponentially by seconds. For example, if your default minimum wait time between retries is 2 seconds, the next retry wait time is 4 seconds, and so forth.

This SDK automatically handles the rate limit reached errors (`429`) and implements an exponential backoff (up to 16 seconds):
* If the request fails, wait 2 seconds and retry the request.
* If the request fails, wait 4 seconds and retry the request.
* If the request fails, wait 8 seconds and retry the request.
* If the request fails, wait 16 seconds and retry the request.

## License

This library is released under the MIT license. See [LICENSE](LICENSE) for details.
