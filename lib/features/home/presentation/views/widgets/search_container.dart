import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/assets_data.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/features/home/presentation/views/widgets/class_drop_down_menu.dart';
import 'package:flighter/features/home/presentation/views/widgets/custom_date_picker_row.dart';
import 'package:flighter/features/home/presentation/views/widgets/search_text_form_field.dart';
import 'package:flighter/features/home/presentation/views/widgets/traveler_form_field.dart';
import 'package:flighter/features/home/presentation/views/widgets/trip_type_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({
    super.key,
  });

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  bool oneWay = false;
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
                  const SearchTextFormField(
                    text: 'From (Location)',
                    iconData: Icons.flight_takeoff,
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  const SearchTextFormField(
                    text: 'To (Destination)',
                    iconData: Icons.flight_land,
                  ),
                ],
              ),
              Positioned(
                  left: MediaQuery.sizeOf(context).width * 0.8,
                  top: MediaQuery.sizeOf(context).height * 0.068,
                  child: Image.asset(
                    AssetsData.kSwapArrowsImage,
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
                TravelerFormField(),
                ClassDropDownMenu(),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              text: 'Search Flight',
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSearchFlightView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
