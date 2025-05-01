bool isMoreThan5DaysPassed(String dateString) {
  final date = DateTime.parse(dateString); // Expects format "yyyy-MM-dd"
  final now = DateTime.now();
  final difference = now.difference(date).inDays;
  return difference > 5;
}
