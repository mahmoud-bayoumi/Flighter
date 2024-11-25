import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/assets_data.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kChooseSeat);
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: kPrimaryColor),
        ),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "08:30 AM",
                          style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text(
                          "CHE",
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.flight, color: Colors.blue),
                        Text(
                          "45 mins",
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "09:15 AM",
                          style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text(
                          "BLR",
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Image(
              image: AssetImage(AssetsData.kLine),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "IndiGo",
                      style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    Text(
                      "2,700 EGP",
                      style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
