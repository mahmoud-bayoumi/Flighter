bool isMoreThan5DaysFromNow(String dateString) {
  final inputDate = DateTime.parse(dateString);
  final now = DateTime.now();

  // Strip time to compare only the date part
  final inputDateOnly =
      DateTime(inputDate.year, inputDate.month, inputDate.day);
  final todayOnly = DateTime(now.year, now.month, now.day);

  if (inputDateOnly.isBefore(todayOnly)) {
    return false; // The date is in the past
  }

  final difference = inputDateOnly.difference(todayOnly).inDays;
  return difference > 5;
}
