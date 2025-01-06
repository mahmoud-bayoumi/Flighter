import 'package:flighter/features/home/presentation/views/widgets/ticket_widget.dart';
import 'package:flutter/material.dart';

class TicketsListViewBuilder extends StatelessWidget {
  const TicketsListViewBuilder({
    super.key,
    required this.flightNumber,
  });

  final int flightNumber;
  final List<String> timeList = const [
    '08:30 AM',
    '09:15 AM',
    '10:00 AM',
    '10:45 AM',
    '11:30 AM',
    '12:15 PM',
    '01:00 PM',
    '01:45 PM',
  ];

  @override
  Widget build(BuildContext context) {
    bool firstTime = true;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: flightNumber,
      itemBuilder: (context, index) {
        if (firstTime) {
          firstTime = false;
        } else {
          index;
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TicketWidget(
            startTime: timeList[index],
            endTime: timeList[(index + 1) % 8],
          ),
        );
      },
    );
  }
}
