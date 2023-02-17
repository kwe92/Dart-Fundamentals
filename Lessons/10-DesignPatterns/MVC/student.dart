class Student {
  Student({required this.name, required this.rollNo});

  String name;
  String rollNo;

  void setName(String nm) {
    name = nm;
  }

  String getName() {
    return name;
  }

  void setRollNo(String rn) {
    rollNo = rn;
  }

  String getRollNo() {
    return rollNo;
  }
}
