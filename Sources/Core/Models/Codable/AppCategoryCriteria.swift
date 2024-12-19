/// The defined target audience by app category.
///
/// A value of 100 indicates that you are or aren’t targeting apps with the same app category as your app.
///
/// The app category targeting dimension is optional and is only applicable to campaigns using
/// a `SupplySource` of `APPSTORE_PRODUCT_PAGES_BROWSE`.
public typealias AppCategoryCriteria = TargetingCriteria<Int>
