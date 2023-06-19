// Enumerated types: enum - Enumerations

//   - special class representing a fixed number of constant values

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
  // after a enumerated list is defined we can then initialize a variable.
  const DayOfWeek dow = DayOfWeek.Sunday;

  switch (dow) {
    case DayOfWeek.Monday:
      print('Numerical day: ${dow.index + 1}');
      print('Monday');
      break;
    case DayOfWeek.Tuesday:
      print('Numerical day: ${dow.index + 1}');
      print('Tuesday');
      break;
    case DayOfWeek.Wednesday:
      print('Numerical day: ${dow.index + 1}');
      print('Wednesday');
      break;
    case DayOfWeek.Thursday:
      print('Numerical day: ${dow.index + 1}');
      print('Thursday');
      break;
    case DayOfWeek.Friday:
      print('Numerical day: ${dow.index + 1}');
      print('Friday');
      break;
    case DayOfWeek.Saturday:
      print('Numerical day: ${dow.index + 1}');
      print('Saturday');
      break;
    case DayOfWeek.Sunday:
      print('Numerical day: ${dow.index + 1}');
      print('Sunday');
      break;
    default:
      print('Not a valid day of the week!');
      break;
  }
}
