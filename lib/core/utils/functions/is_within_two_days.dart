import '../base_cubit/date_time_cubit/model/time_model.dart';

bool isWithin2Days(DateTime bookingDate ,   TimeModel now) {
  final dateNow = DateTime(now.year, now.month, now.day);
  final deadline = bookingDate.add(const Duration(days: 2));
  return dateNow.isBefore(deadline) || dateNow.isAtSameMomentAs(deadline);
}
