import 'package:flighter/features/offers/presentation/view_model/get_offer_cubit/get_offer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/assets_data.dart';

class HotDealsListView extends StatelessWidget {
  final List<String> images = const [
    AssetsData.k10Off,
    AssetsData.k20Off,
    AssetsData.k30Off,
    AssetsData.k40Off,
    AssetsData.k50Off,
    AssetsData.allOffer,
  ];
  const HotDealsListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: GestureDetector(
                onTap: () {
                  if (index == images.length - 1) {
                    BlocProvider.of<GetOfferCubit>(context).getOffers();
                  } else {
                    BlocProvider.of<GetOfferCubit>(context).percentage =
                        (index + 1) * 10;
                    BlocProvider.of<GetOfferCubit>(context)
                        .getOffersWithPercentage(percentage: (index + 1) * 10);
                  }
                },
                child: Image.asset(
                  images[index],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
