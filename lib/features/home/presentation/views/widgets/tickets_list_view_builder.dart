
import 'package:flighter/features/home/presentation/views/widgets/ticket_widget.dart';
import 'package:flutter/material.dart';

class TicketsListViewBuilder extends StatelessWidget {
  const TicketsListViewBuilder({
    super.key,
    required this.flightNumber,
  });

  final int flightNumber;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: flightNumber,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: TicketWidget(),
        );
      },
    );
  }
}
