import 'package:flighter/core/utils/base_cubit/date_time_cubit/model/time_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/time_repo.dart';
import 'get_date_time_state.dart';

class GetTimeCubit extends Cubit<GetTimeState> {
  final TimeRepo timeRepo;
  TimeModel? timeModel;
  GetTimeCubit(this.timeRepo) : super(GetTimeInitial());

  Future<void> fetchUtcTime() async {
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
