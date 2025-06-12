import 'package:flighter/core/utils/base_cubit/connectivity_cubit/connectivity_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityInitial());

  void checkConnectivity() {
    emit(ConnectivityInitial());

    InternetConnection().onStatusChange.listen(
      (event) {
        switch (event) {
          case InternetStatus.connected:
            emit(ConnectivitySuccess());

            break;
          case InternetStatus.disconnected:
            emit(ConnectivityFailure());

            break;
          default:
            emit(ConnectivityFailure());
            break;
        }
      },
    );
  }
}
