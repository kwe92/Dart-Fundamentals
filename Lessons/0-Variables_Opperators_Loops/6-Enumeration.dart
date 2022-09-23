// In the previous lesson we learned about Switch statements.
// In this lesson we will learn about enumeration
// as well as how enumeration can be used with Switch statements.
// enum in the dart programming language is used to create a enumeration list
// that holds a comma separated list of predefined values
// enumeration can be useful if you have predefined values that will not change over time
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
  // after a enum list is defined we can then initialize a variable.
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
