import 'package:flighter/features/offers/presentation/views/widgets/offer_ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/get_offer_cubit/get_offer_cubit.dart';

class OffersListViewBuilder extends StatelessWidget {
  const OffersListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool firstTime = true;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          BlocProvider.of<GetOfferCubit>(context).offersModel.data!.length,
      itemBuilder: (context, index) {
        if (firstTime) {
          firstTime = false;
        } else {
          index;
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: OfferTicketWidget(
              ticketModel: BlocProvider.of<GetOfferCubit>(context)
                  .offersModel
                  .data![index]),
        );
      },
    );
  }
}
