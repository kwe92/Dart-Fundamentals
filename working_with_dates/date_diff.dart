void main() {
  DateTime previousEntryDate = DateTime.now().add(
    Duration(hours: 24),
  );

  print(previousEntryDate
      .difference(
        DateTime.now(),
      )
      .inHours);

  print(isConsecutiveEntry(previousEntryDate));
}

bool isConsecutiveEntry(DateTime date) => (date.difference(DateTime.now()).inHours.abs() < 24);
