import 'package:dio/dio.dart';
import 'package:flighter/core/utils/api_service.dart';
import 'package:flighter/features/auth/data/repos/sign_in_repo/sign_in_repo_impl.dart';
import 'package:flighter/features/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (context) => SignInCubit(SignInRepoImpl(
            apiService: ApiService(Dio(BaseOptions(
          connectTimeout: const Duration(seconds: 10), // 10 seconds
          receiveTimeout: const Duration(seconds: 10), // 10 seconds
        ))))),
        child: const SignInViewBody(),
      )),
    );
  }
}
