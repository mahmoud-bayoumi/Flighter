import 'package:dio/dio.dart';
import 'package:flighter/features/auth/data/repos/sign_in_repo/sign_in_repo_impl.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setupServerLocator() {
  getIt.registerSingleton<ApiService>(ApiService( Dio()));
  getIt.registerSingleton<SignInRepoImpl>(
      SignInRepoImpl(apiService: getIt.get<ApiService>()));
 
}
