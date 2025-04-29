import 'package:dio/dio.dart';
import 'package:flighter/core/utils/flight_api_service.dart';
import 'package:flighter/features/auth/data/repos/reset_password_repos/reset_password_repo/reset_password_repo_impl.dart';
import 'package:flighter/features/auth/data/repos/reset_password_repos/send_reset_pass_code_repo/send_reset_pass_code_repo_impl.dart';
import 'package:flighter/features/auth/data/repos/sign_in_repo/sign_in_repo_impl.dart';
import 'package:flighter/features/auth/data/repos/sign_up_repo/sign_up_repo_impl.dart';
import 'package:flighter/features/auth/data/repos/verify_email_repo/verify_email_repo_impl.dart';
import 'package:flighter/features/auth/data/repos/reset_password_repos/verify_reset_pass_code_repo/verify_reset_pass_code_repo_impl.dart';

import 'package:flighter/features/home/data/repos/airlines_repo/airlines_repo_impl.dart';

import 'package:flighter/features/home/data/repos/from_countries_repo/from_repo_impl.dart';
import 'package:flighter/features/home/data/repos/search_repo/search_repo_impl.dart';

import 'package:flighter/features/home/data/repos/to_countries_repo/to_repo_impl.dart';

import 'package:flighter/features/profile/data/repos/delete_account_repo/delete_account_repo_impl.dart';
import 'package:flighter/features/profile/data/repos/get_profile_photo_repo/get_profile_photo_repo_impl.dart';
import 'package:flighter/features/profile/data/repos/update_profile_repo/update_profile_repo_impl.dart';
import 'package:get_it/get_it.dart';
import '../../features/book_ticket/data/repos/get_seats_repo/get_seats_repo_impl.dart';
import '../../features/book_ticket/data/repos/ticket_summary_repo/ticket_summary_repo_impl.dart';
import '../../features/profile/data/repos/change_password_repo/change_password_repo_impl.dart';
import '../../features/profile/data/repos/delete_profile_photo_repo/delete_profile_photo_repo_impl.dart';
import '../../features/profile/data/repos/get_profile_data/get_profile_data_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServerLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<FlightApiService>(FlightApiService(Dio()));

  getIt.registerSingleton<SignInRepoImpl>(
      SignInRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<SignUpRepoImpl>(
      SignUpRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<VerifyEmailRepoImpl>(
      VerifyEmailRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<SendResetPassCodeRepoImpl>(
      SendResetPassCodeRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<ChangePasswordRepoImpl>(
      ChangePasswordRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<DeleteAccountRepoImpl>(
      DeleteAccountRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<VerifyResetPassCodeRepoImpl>(
      VerifyResetPassCodeRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<ResetPasswordRepoImpl>(
      ResetPasswordRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<GetProfilePhotoRepoImpl>(
      GetProfilePhotoRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<GetProfileDataRepoImpl>(
      GetProfileDataRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<DeleteProfilePhotoRepoImpl>(
      DeleteProfilePhotoRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<UpdateProfileRepoImpl>(
      UpdateProfileRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<ToRepoImpl>(
      ToRepoImpl(apiService: getIt.get<FlightApiService>()));

  getIt.registerSingleton<AirlinesRepoImpl>(
      AirlinesRepoImpl(flightApiService: getIt.get<FlightApiService>()));
  getIt.registerSingleton<FromRepoImpl>(
      FromRepoImpl(apiService: getIt.get<FlightApiService>()));

  getIt.registerSingleton<SearchRepoImpl>(
      SearchRepoImpl(flightApiService: getIt.get<FlightApiService>()));
  getIt.registerSingleton<GetSeatsRepoImpl>(
      GetSeatsRepoImpl(flightApiService: getIt.get<FlightApiService>()));
  getIt.registerSingleton<TicketSummaryRepoImpl>(
      TicketSummaryRepoImpl(flightApiService: getIt.get<FlightApiService>()));
}
