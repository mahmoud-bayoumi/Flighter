import 'package:flighter/core/utils/base_cubit/date_time_cubit/get_date_time_cubit/get_date_time_cubit.dart';
import 'package:flighter/core/utils/base_cubit/date_time_cubit/get_date_time_cubit/get_date_time_state.dart';
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

  Future<void> _onRefresh(BuildContext context) async {
    // Trigger the Cubit's fetch method to reload bookings
    await BlocProvider.of<GetBookingsCubit>(context).getBookings();
  }

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
        Padding(
          padding: EdgeInsets.only(top: 80.h),
          child: BlocBuilder<GetTimeCubit, GetTimeState>(
            builder: (context, state) {
              if (state is GetTimeFailure) {
                return Center(
                  child: Text(
                    'Network Error',
                    style: Styles.textStyle22,
                  ),
                );
              } else if (state is GetTimeSuccess) {
                return BlocBuilder<GetBookingsCubit, GetBookingsState>(
                  builder: (context, state) {
                    if (state is GetBookingsSuccess) {
                      return RefreshIndicator(
                        onRefresh: () => _onRefresh(context),
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: BlocProvider.of<GetBookingsCubit>(context)
                              .bookingsModel
                              .data!
                              .length,
                          itemBuilder: (context, index) {
                            final booking =
                                BlocProvider.of<GetBookingsCubit>(context)
                                    .bookingsModel
                                    .data![index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.h, horizontal: 2.w),
                              child: booking.paymentStatus == 'Paid'
                                  ? FlightDataCardForBookings(
                                      bookingData: booking)
                                  : booking.paymentStatus == 'Pending'
                                      ? const SizedBox.shrink()
                                      : UnPaidFlightDataCardForBookings(
                                          bookingData: booking),
                            );
                          },
                        ),
                      );
                    } else if (state is GetBookingsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Center(
                        child: Text(
                          'No Bookings Yet',
                          style: Styles.textStyle22,
                        ),
                      );
                    }
                  },
                );
              }
              return BlocBuilder<GetBookingsCubit, GetBookingsState>(
                builder: (context, state) {
                  if (state is GetBookingsSuccess) {
                    return RefreshIndicator(
                      onRefresh: () => _onRefresh(context),
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: BlocProvider.of<GetBookingsCubit>(context)
                            .bookingsModel
                            .data!
                            .length,
                        itemBuilder: (context, index) {
                          final booking =
                              BlocProvider.of<GetBookingsCubit>(context)
                                  .bookingsModel
                                  .data![index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 2.w),
                            child: booking.paymentStatus == 'Pending' ||
                                    booking.paymentStatus == 'Paid'
                                ? FlightDataCardForBookings(
                                    bookingData: booking)
                                : UnPaidFlightDataCardForBookings(
                                    bookingData: booking),
                          );
                        },
                      ),
                    );
                  } else if (state is GetBookingsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Center(
                      child: Text(
                        'No Bookings Yet',
                        style: Styles.textStyle22,
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
