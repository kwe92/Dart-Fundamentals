void main() {
  // Record variable declaration: unanmed with type annotation
  (String, int) record;

  record = ("All is number.", 42);

  print(record);

  // Record variable declaration: named with type annotation
  ({String firstName, String lastName, String email, double salary}) employee;

  // Record variable declaration: named and unamed field names | posotional field names go first
  (int, {String firstName, String lastName, String email, double salary}) employee2;

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
