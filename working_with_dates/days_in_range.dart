void main() {
  final first = DateTime.now().add(
    Duration(days: -10, seconds: -1),
  );

  final last = DateTime.now();

  final dayCount = last.difference(first).inDays + 1;

  var daysBetween = daysInRange(first, last);

  print('first: $first');

  print('last: $last');

  print('dayCount: $dayCount');

  print('daysBetween: $daysBetween');
}

/// Return a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}
