// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/functions/dialogs_type.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/features/auth/presentation/view_model/verify_email_cubit/verify_email_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/auth_text_button.dart';
import 'package:flighter/features/auth/presentation/views/widgets/verification_code_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/base_cubit/connectivity_cubit/connectivity_cubit.dart';
import '../../../../../core/utils/base_cubit/connectivity_cubit/connectivity_state.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/widgets/no_internet_connect.dart';
import '../../../../bookings/presentation/view_model/get_bookings_cubit/get_bookings_cubit.dart';
import '../../../../home/presentation/view_model/airlines_cubit/airlines_cubit.dart';
import '../../../../home/presentation/view_model/from_countries_cubit/from_countries_cubit_cubit.dart';
import '../../../../home/presentation/view_model/to_counties_cubit/to_countries_cubit_dart_cubit.dart';
import '../../../../offers/presentation/view_model/get_offer_cubit/get_offer_cubit.dart';
import '../../../../payment/presentation/view_model/payment_cubit/payment_cubit.dart';

class CheckYourEmailBody extends StatefulWidget {
  const CheckYourEmailBody({
    super.key,
    required this.email,
  });
  final String email;
  @override
  State<CheckYourEmailBody> createState() => _CheckYourEmailBodyState();
}

class _CheckYourEmailBodyState extends State<CheckYourEmailBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectivityFailure) {
          return const Center(
            child: NoInternetConnectionView(),
          );
        }  else {
          var cubitData = context.read<VerifyEmailCubit>();
          cubitData.email = widget.email;
          return BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
            listener: (context, state) async {
              if (state is VerifyEmailSuccess) {
                EasyLoading.dismiss();
                log('SignIn Succes');
                await BlocProvider.of<FromCountriesCubit>(context)
                    .getFromCountries();
                 BlocProvider.of<ToCountriesCubit>(context)
                    .getToCountries();
                BlocProvider.of<GetBookingsCubit>(context).userId =
                    BlocProvider.of<VerifyEmailCubit>(context)
                        .verifyModel
                        .message!
                        .userId!;
                 BlocProvider.of<GetBookingsCubit>(context).getBookings();
                BlocProvider.of<PaymentCubit>(context).userId =
                    BlocProvider.of<VerifyEmailCubit>(context)
                        .verifyModel
                        .message!
                        .userId!;
                 BlocProvider.of<AirlinesCubit>(context).getAirlines();
                 BlocProvider.of<GetOfferCubit>(context).getOffers();

                GoRouter.of(context).pushReplacement(AppRouter.kNavigation);
              } else if (state is VerifyEmailFailure) {
                EasyLoading.dismiss();
                errorDialog(context, state.errMsg);
              } else if (state is VerifyEmailLoading) {
                EasyLoading.show(status: 'loading...');
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Form(
                    key: cubitData.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Check your email',
                          style: Styles.textStyle35,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'We sent a verify code to ${widget.email} enter 4 digit code that mentioned in the email',
                          style: Styles.textStyle16
                              .copyWith(color: kGreyColor.withOpacity(0.6)),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        const VerificationCodeRow(),
                        SizedBox(
                          height: 60.h,
                        ),
                        state is VerifyEmailLoading
                            ? const CircularProgressIndicator(
                                color: kPrimaryColor,
                              )
                            : CustomButton(
                                text: 'Verify Code',
                                onPressed: () {
                                  cubitData.validateUser();
                                },
                                height: 65,
                              ),
                        SizedBox(
                          height: 30.h,
                        ),
                        AuthTextButton(
                          authDesc: 'Haven’t got the email yet?',
                          authButtonName: 'Resend email',
                          onPressed: () {
                            showSnackBar(
                              context,
                              message:
                                  'Check your email. We sent your verification code again!',
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
