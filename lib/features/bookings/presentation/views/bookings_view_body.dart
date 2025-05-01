import 'package:flighter/core/widgets/primary_container.dart';
import 'package:flighter/features/bookings/presentation/view_model/get_bookings_cubit/get_bookings_cubit.dart';
import 'package:flighter/features/bookings/presentation/view_model/get_bookings_cubit/get_bookings_state.dart';
import 'package:flighter/features/bookings/presentation/views/widgets/bookins_list_tile.dart';
import 'package:flighter/features/bookings/presentation/views/widgets/flight_data_card.dart';
import 'package:flighter/features/bookings/presentation/views/widgets/unpaid_flight_data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/styles.dart';

class BookingsViewBody extends StatelessWidget {
  const BookingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const PrimaryContainer(),
        Positioned(
          left: MediaQuery.sizeOf(context).width * .01,
          top: MediaQuery.sizeOf(context).height * 0.05,
          child: const BookingListTile(),
        ),
        BlocBuilder<GetBookingsCubit, GetBookingsState>(
          builder: (context, state) {
            if (state is GetBookingsSuccess) {
              return Padding(
                padding: EdgeInsets.only(top: 100.h),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: BlocProvider.of<GetBookingsCubit>(context)
                      .bookingsModel
                      .data!
                      .length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15.h, horizontal: 2.w),
                      child: BlocProvider.of<GetBookingsCubit>(context)
                                  .bookingsModel
                                  .data![index]
                                  .paymentStatus ==
                              'Paid'
                          ? FlightDataCardForBookings(
                              bookingData:
                                  BlocProvider.of<GetBookingsCubit>(context)
                                      .bookingsModel
                                      .data![index],
                            )
                          : UnPaidFlightDataCardForBookings(
                              bookingData:
                                  BlocProvider.of<GetBookingsCubit>(context)
                                      .bookingsModel
                                      .data![index]),
                    );
                  },
                ),
              );
            } else if (state is GetBookingsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Text(
                  'No Bookings Yet',
                  style: Styles.textStyle22,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
