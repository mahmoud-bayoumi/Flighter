import 'package:flighter/constants.dart';
import 'package:flighter/features/home/presentation/views/widgets/home_view_body.dart';

import 'package:flighter/features/offers/presentation/views/offers_view_body.dart';
import 'package:flighter/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeViewBody(),
    const OffersViewBody(),
    const OffersViewBody(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: ClipRRect(
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
      ),
    );
  }
}
