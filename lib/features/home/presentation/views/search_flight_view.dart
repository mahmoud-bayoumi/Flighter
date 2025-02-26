import 'dart:async';

import 'package:flighter/constants.dart';
import 'package:flighter/core/widgets/no_internet_connection_view.dart';
import 'package:flighter/features/home/presentation/views/widgets/search_fligh_view_body.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../auth/presentation/views/widgets/sign_in_view_body.dart';

class SearchFlightView extends StatefulWidget {
  const SearchFlightView({super.key});

  @override
  State<SearchFlightView> createState() => _SearchFlightViewState();
}

class _SearchFlightViewState extends State<SearchFlightView> {
  StreamSubscription? _internetConnectionStreamSubscription;
  @override
  void initState() {
    super.initState();
    _internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen(
      (event) {
        switch (event) {
          case InternetStatus.connected:
            setState(() {
              isConnectedToInternet = true;
            });
            break;
          case InternetStatus.disconnected:
            setState(() {
              isConnectedToInternet = false;
            });
            break;
          default:
            setState(() {
              isConnectedToInternet = false;
            });
            break;
        }
      },
    );
  }

  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isConnectedToInternet
        ? Scaffold(
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
          )
        : const Scaffold(
            body: NoInternetConnectionView(),
          );
  }
}
