

import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/features/book_ticket/data/models/seats_model/seats_model.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/choose_seat_widgets/business_list_view.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/choose_seat_widgets/economy_list_view.dart';
import 'package:flighter/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'selection_status_row.dart';

class ChooseSeatViewBody extends StatelessWidget {
  const ChooseSeatViewBody({super.key, required this.seatsModel});
  final SeatsModel seatsModel;
  /* = const [
    '4A',
    '4B',
    '4C',
    '4D',
    '1A'
  ]; */
  //= const ['5G', '5H', '5F', '5E', '1E'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SelectionStatusRow(
                  selectionColor: kPrimaryColor,
                  selectionText: 'Selected',
                ),
                SelectionStatusRow(
                  selectionColor: kReservedSeatColor,
                  selectionText: 'Reserved',
                ),
                SelectionStatusRow(
                  selectionColor: Colors.black,
                  selectionText: 'Unavaiable',
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            BlocProvider.of<SearchCubit>(context).classTypeIdController.text ==
                    '1'
                ? BusinessListVIew(
                    avaiableSeats: seatsModel.data!.seats!
                        .where((seat) => seat.isBooked == false)
                        .map<String>((seat) => seat.seatName as String)
                        .toList(),
                    resevedSeats: seatsModel.data!.seats!
                        .where((seat) => seat.isBooked == true)
                        .map<String>((seat) => seat.seatName as String)
                        .toList()) // <---------------------
                : EconomyListView(
                    avaiableSeats: seatsModel.data!.seats!
                        .where((seat) => seat.isBooked == false)
                        .map<String>((seat) => seat.seatName as String)
                        .toList(),
                    resevedSeats: seatsModel.data!.seats!
                        .where((seat) => seat.isBooked == true)
                        .map<String>((seat) => seat.seatName as String)
                        .toList()),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: CustomButton(
                text: 'Confirm',
                height: 70.h,
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kFlightDetailes);
                },
              ),
            ),
            SizedBox(
              height: 35.h,
            )
          ],
        ),
      ),
    );
  }
}
