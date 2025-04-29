import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/assets_data.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/functions/capitalize_word.dart';
import '../../../../../core/utils/functions/convert12_hours_format.dart';
import '../../../data/models/offer_ticker_data/offer_ticker_data.dart';

class OfferTicketWidget extends StatelessWidget {
  const OfferTicketWidget({super.key, required this.ticketModel});

  final OfferTicketData ticketModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kChooseSeat);
      },
      child: Card(
        color: Colors.white,
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
                          convertTo12HourFormat(
                              ticketModel.departureTime ?? '08:30'),
                          style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text(
                          capitalizeFirstLetter(ticketModel.from ?? 'CT1'),
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
                          "${ticketModel.durationInMinutes} mins",
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
                          convertTo12HourFormat(
                              ticketModel.arrivalTime ?? '09:15'),
                          style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text(
                          capitalizeFirstLetter(ticketModel.to ?? 'CT2'),
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
                      ticketModel.companyName ?? 'IndiGo',
                      style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    Text(
                      "${ticketModel.price} EGP",
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
