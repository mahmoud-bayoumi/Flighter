String convertTo12HourFormat(String time24) {
  final parts = time24.split(':');
  int hour = int.parse(parts[0]);
  int minute = int.parse(parts[1]);

  String period = hour >= 12 ? 'PM' : 'AM';
  hour = hour % 12;
  if (hour == 0) hour = 12; // علشان الساعة 00 تبقى 12

  return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
}
