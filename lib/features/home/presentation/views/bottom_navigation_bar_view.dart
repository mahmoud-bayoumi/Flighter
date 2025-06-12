import 'dart:developer';

import 'package:flighter/constants.dart';
import 'package:flighter/features/bookings/presentation/views/bookings_view_body.dart';
import 'package:flighter/features/flighter_assistant_bot/views/bot_view.dart';
import 'package:flighter/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flighter/features/offers/presentation/views/offers_view_body.dart';
import 'package:flighter/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/base_cubit/connectivity_cubit/connectivity_cubit.dart';
import '../../../../core/utils/base_cubit/connectivity_cubit/connectivity_state.dart';
import '../../../../core/widgets/no_internet_connect.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key, this.intialIndex = 0});
  final int intialIndex;
  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  late int currentIndex;
  List<Widget> screens = [
    const HomeViewBody(),
    const BookingsViewBody(),
    const OffersViewBody(),
    const ProfileView(),
  ];
  @override
  void initState() {
    super.initState();
    currentIndex = widget.intialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child: const Icon(
            Icons.smart_toy_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const BotView();
              },
            ));
          }),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BlocBuilder<ConnectivityCubit, ConnectivityState>(
        builder: (context, state) {
          if (state is ConnectivityFailure) {
            return const Center(
              child: NoInternetConnectionView(),
            );
          } else {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 5,
                  top: 5,
                ),
                color: kPrimaryColor,
                child: BottomNavigationBar(
                  onTap: (value) {
                    log(value.toString());
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  selectedIconTheme: const IconThemeData(size: 32),
                  unselectedIconTheme: const IconThemeData(size: 28),
                  currentIndex: currentIndex,
                  showUnselectedLabels: true,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white.withOpacity(.65),
                  type: BottomNavigationBarType.shifting,
                  elevation: 0,
                  items: const [
                    BottomNavigationBarItem(
                      backgroundColor: kPrimaryColor,
                      icon: Icon(
                        Icons.home_outlined,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: kPrimaryColor,
                      icon: Icon(
                        Icons.event_note_outlined,
                      ),
                      label: 'Bookings',
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: kPrimaryColor,
                      icon: Icon(
                        Icons.celebration_outlined,
                      ),
                      label: 'Offers',
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: kPrimaryColor,
                      icon: Icon(
                        Icons.person,
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
