import 'package:flighter/core/widgets/failure_page_widget.dart';
import 'package:flighter/core/widgets/primary_container.dart';
import 'package:flighter/features/offers/presentation/view_model/get_offer_cubit/get_offer_cubit.dart';
import 'package:flighter/features/offers/presentation/view_model/get_offer_cubit/get_offer_state.dart';
import 'package:flighter/features/offers/presentation/views/widgets/offers_list_view_builder.dart';
import 'package:flighter/features/offers/presentation/views/widgets/offers_view_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/styles.dart';
import 'widgets/hot_deals_list_view.dart';

class OffersViewBody extends StatelessWidget {
  const OffersViewBody({super.key});
  final int flightNumber = 7;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
            ),
            const PrimaryContainer(
              height: 0.35,
            ),
            Positioned(
              left: MediaQuery.sizeOf(context).width * .01,
              top: MediaQuery.sizeOf(context).height * 0.05,
              child: const OffersViewListTile(),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.sizeOf(context).height *
                  0.16, // Start from the top
              child: SizedBox(
                height: 120.h, // Set height for the horizontal list
                child: const HotDealsListView(), // Hot deals widget
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.sizeOf(context).height * .25),
              child: BlocBuilder<GetOfferCubit, GetOfferState>(
                builder: (context, state) {
                  if (state is GetOfferSuccess) {
                    if (BlocProvider.of<GetOfferCubit>(context)
                        .offersModel
                        .data!
                        .isEmpty) {
                      return SizedBox(
                          height: MediaQuery.sizeOf(context).height / 2,
                          child: Center(
                            child: Text(
                              'No available tickets with ${BlocProvider.of<GetOfferCubit>(context).percentage}% offer.',
                              style: Styles.textStyle22,
                            ),
                          ));
                    }
                    return SizedBox(
                        height: MediaQuery.sizeOf(context).height +
                            (flightNumber * 200.h),
                        child: const OffersListViewBuilder());
                  } else if (state is GetOfferLoading) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * .3),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return const FailurePageWidget();
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
