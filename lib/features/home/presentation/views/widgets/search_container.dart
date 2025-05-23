import 'dart:developer';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/assets_data.dart';
import 'package:flighter/core/utils/functions/dialogs_type.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/features/home/presentation/view_model/from_countries_cubit/from_countries_cubit_cubit.dart';
import 'package:flighter/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flighter/features/home/presentation/view_model/search_cubit/search_state.dart';
import 'package:flighter/features/home/presentation/views/widgets/class_drop_down_menu.dart';
import 'package:flighter/features/home/presentation/views/widgets/currency_modal.dart';
import 'package:flighter/features/home/presentation/views/widgets/custom_date_picker_row.dart';
import 'package:flighter/features/home/presentation/views/widgets/search_text_form_field.dart';
import 'package:flighter/features/home/presentation/views/widgets/traveler_drop_down_menu.dart';
import 'package:flighter/features/home/presentation/views/widgets/trip_type_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/functions/capitalize_fist_letter.dart';
import '../../view_model/to_counties_cubit/to_countries_cubit_dart_cubit.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({
    super.key,
  });

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  bool oneWay = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TripTypeButton(
                    tripTypeName: 'One Way',
                    onTap: () {
                      setState(() {
                        oneWay = true;
                        BlocProvider.of<SearchCubit>(context)
                            .endDateController
                            .text = '';
                      });
                    },
                    oneWay: oneWay,
                  ),
                  TripTypeButton(
                    tripTypeName: 'Round Trip',
                    onTap: () {
                      setState(() {
                        oneWay = false;
                      });
                    },
                    oneWay: !oneWay,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Stack(children: [
              Column(
                children: [
                  BlocBuilder<FromCountriesCubit, FromCountriesCubitState>(
                    builder: (context, state) {
                      return SearchTextFormField(
                        text: 'From (Location)',
                        iconData: Icons.flight_takeoff,
                        forFrom: true,
                        controller: BlocProvider.of<SearchCubit>(context)
                            .fromController,
                        countrySuggestions: capitalizeFirstLetterOfEach(
                            BlocProvider.of<FromCountriesCubit>(context)
                                .fromCountries),
                      );
                    },
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  BlocBuilder<ToCountriesCubit, ToCountriesCubitDartState>(
                    builder: (context, state) {
                      return SearchTextFormField(
                        text: 'To (Destination)',
                        iconData: Icons.flight_land,
                        forFrom: false,
                        controller:
                            BlocProvider.of<SearchCubit>(context).toController,
                        countrySuggestions: capitalizeFirstLetterOfEach(
                            context.read<ToCountriesCubit>().toModel!.data),
                      );
                    },
                  ),
                ],
              ),
              Positioned(
                  left: MediaQuery.sizeOf(context).width * 0.78,
                  top: MediaQuery.sizeOf(context).height * 0.070,
                  child: GestureDetector(
                    onTap: () {
                      /*         String temp = firstController.text;
                      setState(() {
                        firstController.text = secondController.text;
                        secondController.text = temp;
                      }); */
                    },
                    child: Image.asset(
                      AssetsData.kSwapArrowsImage,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  )),
            ]),
            SizedBox(
              height: 20.h,
            ),
            CustomDatePickerRow(
              oneWay: oneWay,
            ),
            SizedBox(
              height: 20.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TravelerDropDownMenu(),
                ClassDropDownMenu(),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocListener<SearchCubit, SearchState>(
              listener: (context, state) {
                if (state is SearchSucess) {
                  EasyLoading.dismiss();

                  if (BlocProvider.of<SearchCubit>(context)
                      .searchModel
                      .data!
                      .isNotEmpty) {
                    if (BlocProvider.of<SearchCubit>(context).secondPush) {
                      BlocProvider.of<SearchCubit>(context).secondPush = false;
                    } else {
                      GoRouter.of(context).push(AppRouter.kSearchFlightView);
                    }
                  } else {
                    noTicketsAvailable(context);
                  }
                } else if (state is SearchLoading) {
                  EasyLoading.show(status: 'loading...');
                } else if (state is SearchFailure) {
                  EasyLoading.dismiss();

                  log(state.errMessage);
                }
              },
              child: CustomButton(
                text: 'Search Flight',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // trigger search after selection of currnecy
                    await showCurrencyModal(context, currency);

                    await BlocProvider.of<SearchCubit>(context).getSearchData();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
