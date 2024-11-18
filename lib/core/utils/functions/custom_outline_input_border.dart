import 'package:flutter/material.dart';

OutlineInputBorder customOutlineInputBorder({Color? color = Colors.white}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color!,
    ),
    borderRadius: BorderRadius.circular(6),
  );
}
