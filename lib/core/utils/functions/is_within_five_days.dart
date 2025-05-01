bool isWithinFiveDays(DateTime bookingDate) {
  final now = DateTime.now();
  final deadline = bookingDate.add(const Duration(days: 5));
  return now.isBefore(deadline) || now.isAtSameMomentAs(deadline);
}
