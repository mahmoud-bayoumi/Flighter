import 'package:flighter/core/utils/base_cubit/date_time_cubit/model/time_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/time_repo.dart';
import 'get_date_time_state.dart';

class GetTimeCubit extends Cubit<GetTimeState> {
  final TimeRepo timeRepo;
  TimeModel timeModel = TimeModel(
    year: DateTime.now().year,
    month: DateTime.now().month,
    day: DateTime.now().day,
    hour: DateTime.now().hour,
    minute: DateTime.now().minute,
    seconds: DateTime.now().second,
    milliSeconds: DateTime.now().millisecond,
    dateTime: DateTime.now().toIso8601String(),
    date: DateTime.now().toIso8601String().split('T')[0],
    time: DateTime.now().toIso8601String().split('T')[1].split('.')[0],
    timeZone: DateTime.now().timeZoneName,
    dayOfWeek: DateTime.now().weekday.toString(),
    dstActive: DateTime.now().isUtc ? false : true,
  );
  GetTimeCubit(this.timeRepo) : super(GetTimeInitial());

  Future<void> fetchUtcTime() async {

    timeModel.year = DateTime.now().year;
    emit(GetTimeLoading());
    final result = await timeRepo.getCurrentUtcTime();
    result.fold(
      (error) => emit(GetTimeFailure(error)),
      (timeModel) {
        this.timeModel = timeModel; 
         emit(GetTimeSuccess());
      },
    );
  }
}
