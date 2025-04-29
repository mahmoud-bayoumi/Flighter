import 'package:flighter/constants.dart';
import 'package:flighter/features/home/presentation/views/widgets/search_fligh_view_body.dart';
import 'package:flutter/material.dart';


class SearchFlightView extends StatelessWidget {
  const SearchFlightView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const Text(
          'Select your Flight',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const SearchFligthViewBody(),
    );
  }
}
