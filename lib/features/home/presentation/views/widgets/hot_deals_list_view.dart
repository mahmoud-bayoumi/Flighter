import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_data.dart';

class HotDealsListView extends StatelessWidget {
  final List<String> images = const [
    AssetsData.kSpecialDiscount,
    AssetsData.kEasyBooking
  ];
  const HotDealsListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                images[index % 2],
              ),
            ),
          ),
        );
      },
    );
  }
}