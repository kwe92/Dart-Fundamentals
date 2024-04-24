void main() {
  // Record variable declaration: with unnamed type annotation
  (String, int) record;

  // initialize with Record expression
  record = ("All is number.", 42);

  print(record);

  // Record variable declaration: with named type annotation
  ({String firstName, String lastName, String email, double salary}) employee;

  // Record variable declaration: named and unamed field names | positional field names go first
  (int employeeID, {String firstName, String lastName, String email, double salary}) employee2;

  employee = (
    firstName: "Baki",
    lastName: "Hanma",
    email: "Baki@hanma.anime",
    salary: 999999999999,
  );

  employee2 = (
    1001,
    firstName: "Gara",
    lastName: "Unknown",
    email: "Gara@sandking.alaph",
    salary: 999999999999,
  );

  print(employee);

  print(employee2);
}

// Naming Positional Fields

//   - the names of positional fields are not part of a Records type signature

// Named Fields of a Record

//   - part of the Record's type signature
