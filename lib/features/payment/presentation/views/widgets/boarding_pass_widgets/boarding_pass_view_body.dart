import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_small_button.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/from_to_country_second.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/row_flight_detailes.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/unabled_text_field.dart';
import 'package:flighter/features/payment/presentation/views/widgets/boarding_pass_widgets/name_with_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoardingPassViewBody extends StatelessWidget {
  const BoardingPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: NamewithDivider(
              name: 'Yasser Osama',
            ),
          ),
          SizedBox(
            height: 200.h,
            child: const FromToCountrySecond(from: 'CHE', to: 'BLR'),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UnabledTextField(text: '06/07/2023', icon: Icons.access_time),
              UnabledTextField(text: '9:30 AM', icon: Icons.access_time),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(
              thickness: 1,
              color: kGreyColor.withOpacity(.3),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.w, right: 20.w),
            child: const RowFlightDetailes(),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(
              thickness: 1,
              color: kGreyColor.withOpacity(.3),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            '230222-BE143',
            style: Styles.textStyle45.copyWith(color: Colors.black),
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomSmallButton(
            text: 'Confirm',
            blue: true,
            minWidth: .7,
            onPressed: () {},
          ),
          SizedBox(
            height: 10.h,
          ),
          TextButton(
            style: const ButtonStyle(
              splashFactory: NoSplash.splashFactory,
            ),
            child: Text(
              'Go Home',
              style: Styles.textStyle22
                  .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
