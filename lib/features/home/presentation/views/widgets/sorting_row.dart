
import 'package:flighter/features/home/data/models/airline.dart';
import 'package:flighter/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flighter/features/home/presentation/view_model/search_cubit/search_state.dart';
import 'package:flighter/features/home/presentation/views/widgets/sort_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'filters_modal.dart';

class SortingRow extends StatelessWidget {
  final List<Airline> airlines;
  final List<String> airlineNames;
  final Map<String, bool> stringBoolMap;
  const SortingRow({
    super.key,
    required this.airlines,
    required this.airlineNames,
    required this.stringBoolMap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                SortButton(
                  isSelected:
                      BlocProvider.of<SearchCubit>(context).cheapestFilter,
                  text: 'Cheapest',
                  onTap: () {
                    BlocProvider.of<SearchCubit>(context).cheapestFilter =
                        !BlocProvider.of<SearchCubit>(context).cheapestFilter;
                    BlocProvider.of<SearchCubit>(context).secondPush = true;
                    BlocProvider.of<SearchCubit>(context).getSearchData();
                  },
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                SortButton(
                  isSelected:
                      BlocProvider.of<SearchCubit>(context).fastestFilter,
                  text: 'Fastest',
                  onTap: () {
                    BlocProvider.of<SearchCubit>(context).fastestFilter =
                        !BlocProvider.of<SearchCubit>(context).fastestFilter;
                    BlocProvider.of<SearchCubit>(context).secondPush = true;

                    BlocProvider.of<SearchCubit>(context).getSearchData();
                  },
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                SortButton(
                  isSelected:
                      BlocProvider.of<SearchCubit>(context).airlinesFilter,
                  text: 'Airlines',
                  onTap: () {
                    BlocProvider.of<SearchCubit>(context).airlinesFilter =
                        !BlocProvider.of<SearchCubit>(context).airlinesFilter;

                    showFiltersModal(context, stringBoolMap);
        },
                ),
                SizedBox(
                  width: 10.w,
                ),
                SortButton(
                  isSelected: true,
                  text: 'All Filters',
                  onTap: () {},
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
