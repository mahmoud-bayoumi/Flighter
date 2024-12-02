import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/custom_outline_input_border.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFormField extends StatefulWidget {
  final IconData iconData;
  final String text;
  final bool forFrom;
  final TextEditingController controller;
  const SearchTextFormField({
    super.key,
    required this.iconData,
    required this.text,
    required this.forFrom, required this.controller,
  });

  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        showAutoFillFormField(context);
      },
      controller: widget.controller,
      autocorrect: true,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: kPrimaryColor),
        prefixIconColor: kPrimaryColor,
        contentPadding: EdgeInsets.symmetric(vertical: 25.h),
        labelText: widget.text,
        prefixIcon: Icon(widget.iconData),
        border: customOutlineInputBorder(color: kPrimaryColor),
        enabledBorder: customOutlineInputBorder(color: kPrimaryColor),
        focusedBorder: customOutlineInputBorder(color: kPrimaryColor),
      ),
    );
  }

  Future<String> showAutoFillFormField(BuildContext context) async {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: kPrimaryColor,
                      )),
                  Text(
                    widget.forFrom ? 'Where From?' : 'Where To?',
                    style: Styles.textStyle20.copyWith(color: kPrimaryColor),
                  )
                ],
              ),
              const Divider(),
              SizedBox(
                height: 70.h,
                width: MediaQuery.sizeOf(context).width * 0.95,
                child: TextFormField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: kPrimaryColor),
                    prefixIconColor: kPrimaryColor,
                    hintText: 'Country , city',
                    prefixIcon: Icon(widget.iconData),
                    border: customOutlineInputBorder(color: kPrimaryColor),
                    enabledBorder:
                        customOutlineInputBorder(color: kPrimaryColor),
                    focusedBorder:
                        customOutlineInputBorder(color: kPrimaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              widget.forFrom
                  ? const ListTile(
                      leading: Icon(
                        Icons.my_location,
                        color: kPrimaryColor,
                      ),
                      title: Text(
                        'Current Location',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                      subtitle: Text(
                        'Use current location',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              Text(
                'Suggested places',
                style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.bold, color: kPrimaryColor),
              ),
              ListTile(
                onTap: () {
                  widget.controller.text = 'Cairo';
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.flight,
                  color: kPrimaryColor,
                ),
                title: const Text(
                  'Cairo',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
                subtitle: const Text(
                  'city',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                 widget.controller.text = 'Alexandria';
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.flight,
                  color: kPrimaryColor,
                ),
                title: const Text(
                  'Alexandria',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
                subtitle: const Text(
                  'city',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                 widget. controller.text = 'Aswan';
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.flight,
                  color: kPrimaryColor,
                ),
                title: const Text(
                  'Aswan ',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
                subtitle: const Text(
                  'Asyut ',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                 widget. controller.text = 'Beni Suef';
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.flight,
                  color: kPrimaryColor,
                ),
                title: const Text(
                  'Beni Suef',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
                subtitle: const Text(
                  'city',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    return '';
  }
}
