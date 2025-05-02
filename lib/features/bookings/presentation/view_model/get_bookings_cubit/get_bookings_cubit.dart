import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/bookings_model/bookings_model.dart';
import '../../../data/repos/bookings_repo/bookings_repo.dart';
import 'get_bookings_state.dart';

class GetBookingsCubit extends Cubit<GetBookingsState> {
  late String userId;
  final BookingsRepo bookingsRepo;
  late BookingsModel bookingsModel;
  bool haveBookings = true;
  GetBookingsCubit(this.bookingsRepo) : super(GetBookingsInitial());
  Future<void> getBookings() async {
    emit(GetBookingsLoading());
    var respone = await bookingsRepo.getBookingsTickets(userId: userId);
    respone.fold((error) {
      haveBookings = false;
      emit(GetBookingsFailure(errMessage: error.errMessage));
    }, (data) {
      bookingsModel = data;
      bookingsModel.data = data.data!.reversed.toList();
      haveBookings = true;
      emit(GetBookingsSuccess());
    });
  }
}
