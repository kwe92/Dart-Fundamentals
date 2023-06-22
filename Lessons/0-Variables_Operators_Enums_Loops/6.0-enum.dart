// Enumerated types: enum - Enumerations

//   - a set of unique constant values, defined by a special class

enum DayOfWeek {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}

/// The entry point to our program.
void main() {
  // variables can be initalized from an enumerated list
  const DayOfWeek dow = DayOfWeek.Sunday;

  switch (dow) {
    case DayOfWeek.Monday:
      _getDayByNumber(dow);
      print('Monday');
    case DayOfWeek.Tuesday:
      _getDayByNumber(dow);
      print('Tuesday');

    case DayOfWeek.Wednesday:
      _getDayByNumber(dow);
      print('Wednesday');

    case DayOfWeek.Thursday:
      _getDayByNumber(dow);
      print('Thursday');

    case DayOfWeek.Friday:
      _getDayByNumber(dow);
      print('Friday');

    case DayOfWeek.Saturday:
      _getDayByNumber(dow);
      print('Saturday');

    case DayOfWeek.Sunday:
      _getDayByNumber(dow);
      print('Sunday');

    default:
      print('Not a valid day of the week!');
  }
}

void _getDayByNumber(DayOfWeek dow) => print(
      'Numerical day: ${dow.index + 1}',
    );
