import 'package:flighter/constants.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/flight_detailes_view_body.dart';
import 'package:flutter/material.dart';

class FlightDetailesView extends StatelessWidget {
  const FlightDetailesView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Flight details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: const FlightDetailesViewBody(),
    );
  }
}
