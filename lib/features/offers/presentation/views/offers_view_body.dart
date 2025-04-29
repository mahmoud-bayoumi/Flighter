import 'package:flighter/core/widgets/primary_container.dart';
import 'package:flighter/features/offers/presentation/views/widgets/offers_view_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/presentation/views/widgets/hot_deals_list_view.dart';

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
                padding: EdgeInsets.only(top: 280.h),
                child: const Text('delete the comments on the list')
                /*SizedBox(
                  height: MediaQuery.sizeOf(context).height +
                      (flightNumber * 200.h),
                  child: TicketsListViewBuilder()),*/
                ),
          ],
        ),
      ),
    );
  }
}
