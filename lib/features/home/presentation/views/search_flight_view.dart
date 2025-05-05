import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/base_cubit/connectivity_cubit/connectivity_cubit.dart';
import 'package:flighter/core/utils/base_cubit/connectivity_cubit/connectivity_state.dart';
import 'package:flighter/core/widgets/no_internet_connect.dart';
import 'package:flighter/features/home/presentation/views/widgets/search_fligh_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFlightView extends StatelessWidget {
  const SearchFlightView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectivityFailure) {
          return const Center(
            child: NoInternetConnectionView(),
          );
        }else {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: kPrimaryColor,
              centerTitle: true,
              title: const Text(
                'Select your Flight',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: const SearchFligthViewBody(),
          );
        }
      },
    );
  }
}
