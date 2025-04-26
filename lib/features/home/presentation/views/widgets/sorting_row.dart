import 'dart:developer';

import 'package:flighter/features/home/data/models/airline.dart';
import 'package:flighter/features/home/presentation/views/widgets/sort_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class SortingRow extends StatefulWidget {
  final List<Airline> airlines;
  final List<String> airlineNames;
  final Map<String, bool> stringBoolMap;
  const SortingRow({
    super.key,
    required this.airlines, required this.airlineNames, required this.stringBoolMap,
  });

  @override
  State<SortingRow> createState() => _SortingRowState();
}

class _SortingRowState extends State<SortingRow> {
  bool isBest = false;

  bool isCheapest = false;

  bool isFastest = false;

  bool isDirect = false;

  bool isAll = true;
  bool isAirlines = false;

  void resetBoolean() {
    isCheapest = false;
    isBest = false;
    isFastest = false;
    isDirect = false;
    isAll = false;
    isAirlines = false;
  }

  @override
  Widget build(BuildContext context) {
   
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            SortButton(
              isSelected: isCheapest,
              text: 'Cheapest',
              onTap: () {
                setState(() {
                  resetBoolean();
                  isCheapest = true;
                });
              },
            ),
            SizedBox(
              width: 10.w,
            ),
            SortButton(
              isSelected: isBest,
              text: 'Best',
              onTap: () {
                setState(() {
                  resetBoolean();
                  isBest = true;
                });
              },
            ),
            SizedBox(
              width: 10.w,
            ),
            SortButton(
              isSelected: isFastest,
              text: 'Fastest',
              onTap: () {
                setState(() {
                  resetBoolean();
                  isFastest = true;
                });
              },
            ),
            SizedBox(
              width: 10.w,
            ),
            SortButton(
              isSelected: isDirect,
              text: 'Direct',
              onTap: () {
                setState(() {
                  resetBoolean();
                  isDirect = true;
                });
              },
            ),
            SizedBox(
              width: 10.w,
            ),
            SortButton(
              isSelected: isAirlines,
              text: 'Airlines',
              onTap: () {
                setState(() {
                  resetBoolean();
                  isAirlines = true;
                });

                showFiltersModal(context, widget.stringBoolMap);
                log('Airlines: ${widget.stringBoolMap}');
              },
            ),
            SizedBox(
              width: 10.w,
            ),
            SortButton(
              isSelected: isAll,
              text: 'All Filters',
              onTap: () {
                setState(() {
                  resetBoolean();
                  isAll = true;
                });
              },
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
      ),
    );
  }
}

void showFiltersModal(BuildContext context, Map<String, bool> airlines) {
  showModalBottomSheet(
      context: context,
      builder: (context) => FiltersModal(
            airlines: airlines,
          ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ));
}

class FiltersModal extends StatefulWidget {
  final Map<String, bool> airlines;
  const FiltersModal({super.key, required this.airlines});

  @override
  State<FiltersModal> createState() => _FiltersModalState();
}

class _FiltersModalState extends State<FiltersModal> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildAirlinesSection(widget.airlines),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Airlines',
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            )),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
          color: kPrimaryColor,
        ),
      ],
    );
  }

  Widget _buildAirlinesSection(Map<String, bool> airlines) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...airlines.entries.map((entry) => Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${entry.key} ', style: Styles.textStyle16),
                    ],
                  ),
                  trailing: Checkbox(
                    activeColor: kPrimaryColor,
                    value: airlines[entry.key],
                    onChanged: (value) =>
                        setState(() => airlines[entry.key] = value!),
                  ),
                ),
                const Divider(height: 1),
              ],
            )),
      ],
    );
  }
}
