import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/features/bookings/presentation/views/bookings_view_body.dart';
import 'package:flighter/features/home/data/repos/search_repo/search_repo_impl.dart';
import 'package:flighter/features/home/presentation/view_model/search_cubit/search_cubit.dart';
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
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
      child: Scaffold(
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
            } else if (state is ConnectivityLoading) {
              return const Center(
                child: CircularProgressIndicator(),
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
      ),
    );
  }
}
