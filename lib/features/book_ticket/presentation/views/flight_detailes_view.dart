import 'package:flighter/constants.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/flight_detailes_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/base_cubit/connectivity_cubit/connectivity_cubit.dart';
import '../../../../core/utils/base_cubit/connectivity_cubit/connectivity_state.dart';
import '../../../../core/widgets/no_internet_connect.dart';

class FlightDetailesView extends StatelessWidget {
  const FlightDetailesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectivityFailure) {
          return const Center(
            child: NoInternetConnectionView(),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: const Text(
                'Flight details',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: kPrimaryColor,
            ),
            body: const FlightDetailesViewBody(),
          );
        }
      },
    );
  }
}
