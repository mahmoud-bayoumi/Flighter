import 'package:flighter/constants.dart';
import 'package:flutter/material.dart';

class SortButton extends StatelessWidget {
  const SortButton({
    super.key,
    required this.isSelected,
    this.onTap,
    required this.text,
  });
  final bool isSelected;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kPrimaryColor,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black.withOpacity(.5)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          );
  }
}
