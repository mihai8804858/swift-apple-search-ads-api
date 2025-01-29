/// The defined targeted audience according to app downloads.
///
/// To target all users, don’t include the AppDownloaderCriteria dimension in the request payload.
/// Use the adamId of the app you’re promoting in your campaign as an included or excluded value.
public typealias AppDownloaderCriteria = TargetingCriteria<String>
