import 'package:flighter/features/home/data/repos/airlines_repo/airlines_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/airline.dart';
import 'airlines_state.dart';

class AirlinesCubit extends Cubit<AirlinesState> {
  final AirlinesRepo airlinesRepo;
  List<Airline> airlines = [];
  AirlinesCubit(this.airlinesRepo) : super(AirlinesInitial());

  Future<void> getAirlines() async {
    emit(AirlinesLoading());
    var response = await airlinesRepo.getAirlines();
    response.fold(
      (l) {
        emit(AirlinesFailure(errMessage: l.errMessage));
      },
      (r) {
        airlines = r;
        emit(AirlinesSuccess());
      },
    );
  }
}
