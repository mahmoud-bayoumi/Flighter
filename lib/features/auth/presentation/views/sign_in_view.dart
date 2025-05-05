import 'package:flighter/core/utils/base_cubit/connectivity_cubit/connectivity_cubit.dart';
import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/features/auth/data/repos/sign_in_repo/sign_in_repo_impl.dart';
import 'package:flighter/features/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/base_cubit/connectivity_cubit/connectivity_state.dart';
import '../../../../core/widgets/no_internet_connect.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
            body: SafeArea(
                child: BlocProvider(
              create: (context) => SignInCubit(getIt.get<SignInRepoImpl>()),
              child: const SignInViewBody(),
            )),
          );
        }
      },
    );
  }
}
