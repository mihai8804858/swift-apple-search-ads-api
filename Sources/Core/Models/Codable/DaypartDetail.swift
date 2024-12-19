/// The defined targeted audience to include by a specific time of day.
///
/// Numbers ranging from 0 to 167 represent the hours of a week beginning at Sunday 12:00 midnight.
/// For example, the hour beginning Monday at 1:00 a.m. is 25.
public typealias DaypartDetail = TargetingCriteria<Int>
