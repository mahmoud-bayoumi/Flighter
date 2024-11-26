import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'widgets/cancel_your_ticket_view_body.dart';

class CancelYourTicketView extends StatelessWidget {
  const CancelYourTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Cancel Your Ticket ',
            style: Styles.textStyle24,
          ),
        ),
        body: const SafeArea(
          child: CancelYourTicketViewBody(),
        ));
  }
}
