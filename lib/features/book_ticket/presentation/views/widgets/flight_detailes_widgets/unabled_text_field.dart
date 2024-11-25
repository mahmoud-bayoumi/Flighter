import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnabledTextField extends StatefulWidget {
  const UnabledTextField({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;
  @override
  State<UnabledTextField> createState() => _UnabledTextFieldState();
}

class _UnabledTextFieldState extends State<UnabledTextField> {
  TextEditingController? controller;
  @override
  void initState() {
    controller = TextEditingController(text: widget.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170.w,
      child: TextField(
        controller: controller,
        enabled: false,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          label: const Text('Date'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
