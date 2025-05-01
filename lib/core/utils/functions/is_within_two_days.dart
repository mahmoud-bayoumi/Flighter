bool isWithin2Days(DateTime bookingDate) {
  final now = DateTime.now();
  final deadline = bookingDate.add(const Duration(days: 2));
  return now.isBefore(deadline) || now.isAtSameMomentAs(deadline);
}
