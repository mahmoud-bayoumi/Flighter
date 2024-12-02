import 'package:flighter/features/home/presentation/views/widgets/sort_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortingRow extends StatefulWidget {
  const SortingRow({
    super.key,
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

  void resetBoolean() {
    isCheapest = false;
    isBest = false;
    isFastest = false;
    isDirect = false;
    isAll = false;
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
