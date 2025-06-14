import 'package:flighter/core/utils/base_cubit/date_time_cubit/model/time_model.dart';


bool isMoreThan5DaysFromNow(String dateString , TimeModel now) {
  final inputDate = DateTime.parse(dateString);
   // Strip time to compare only the date part
  final inputDateOnly =
      DateTime(inputDate.year, inputDate.month, inputDate.day);
  final todayOnly = DateTime(now.year!, now.month!, now.day!);
  if (inputDateOnly.isBefore(todayOnly)) {
    return false; // The date is in the past
  }

  final difference = inputDateOnly.difference(todayOnly).inDays;
  return difference > 5;
}
