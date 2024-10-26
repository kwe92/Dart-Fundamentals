enum DayOfWeek {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}

abstract class CustomEnum implements Enum {
  // void printValues();
}

enum CustEnum implements CustomEnum {
  Day,
}

void main() {
  const DayOfWeek dow = DayOfWeek.Sunday;

  switch (dow) {
    case DayOfWeek.Monday:
      _getDayByNumber(dow);
      print(DayOfWeek.Monday.name);
    case DayOfWeek.Tuesday:
      _getDayByNumber(dow);
      print(DayOfWeek.Tuesday.name);

    case DayOfWeek.Wednesday:
      _getDayByNumber(dow);
      print(DayOfWeek.Wednesday.name);

    case DayOfWeek.Thursday:
      _getDayByNumber(dow);
      print(DayOfWeek.Thursday.name);

    case DayOfWeek.Friday:
      _getDayByNumber(dow);
      print(DayOfWeek.Friday.name);

    case DayOfWeek.Saturday:
      _getDayByNumber(dow);
      print(DayOfWeek.Saturday.name);

    case DayOfWeek.Sunday:
      _getDayByNumber(dow);
      print(DayOfWeek.Sunday.name);

    default:
      print('Not a valid day of the week!');
  }
}

void _getDayByNumber(DayOfWeek dow) => print(
      'Numerical day: ${dow.index + 1}',
    );


// Enumerated types: Enumerations - enums

//   - a special class representing a fixed set of unique constant values

//   - in dart enums automatically extend the Enum class under the hood

//   - enums are also sealed, meaning they cannot be implemented, mixedin, subclassed, or instantiated

//   - abstract classes and mixin's can implements Enum but must then be implemented by or mixed into an enum declaration

// Enum Values

//   - accessible individually by the static name given or by the static values constant
//     which returns an array of all the declared instances

// Enum Value Index

//   - every value in an enum has an associated index

//   - the index positioning starts off at 0 (zero-based index)

//   - the index assigned to an enums value is in the order in which they
//     were declared when the enum was declared

// Enum name

//   - by default all fixed values declared within an enum have an associated name property
//     that returns a string representation of the fixed values name

// When to Use an Enum?

//   - when you have a set of values that are immutable and will be used throughout your application
//     and you don't want to worry about mispelling or type mismatches when utilizing those valuess