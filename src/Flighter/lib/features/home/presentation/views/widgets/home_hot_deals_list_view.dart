import 'package:flighter/features/offers/presentation/view_model/get_offer_cubit/get_offer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets_data.dart';

class HomeHotDealsListView extends StatelessWidget {
  final List<String> images = const [
    AssetsData.k10off,
    AssetsData.k20off,
    AssetsData.k30off,
    AssetsData.k40off,
    AssetsData.k50off,
    AssetsData.kAllOffers
  ];
  const HomeHotDealsListView({
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
          width: MediaQuery.sizeOf(context).width * .3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
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
                  GoRouter.of(context).push(AppRouter.kOffersNavigation);
                },
                child: Image.asset(
                  fit: BoxFit.cover,
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
