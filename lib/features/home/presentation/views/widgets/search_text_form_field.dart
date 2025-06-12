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
  final List<dynamic> countrySuggestions;
  const SearchTextFormField({
    super.key,
    required this.iconData,
    required this.text,
    required this.forFrom,
    required this.controller,
    required this.countrySuggestions,
  });

  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  List<dynamic> filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    filteredSuggestions =
        widget.countrySuggestions; // Initially show all suggestions
    widget.controller.text = widget.countrySuggestions[0];
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          filteredSuggestions = widget.countrySuggestions
              .where((country) =>
                  country.toLowerCase().contains(value.toLowerCase()))
              .toList();
        });
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
      onTap: () {
        showAutoFillFormField(context);
      },
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
              SizedBox(height: 10.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close, color: kPrimaryColor),
                  ),
                  Text(
                    widget.forFrom ? 'Where From?' : 'Where To?',
                    style: Styles.textStyle20.copyWith(color: kPrimaryColor),
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: 70.h,
                width: MediaQuery.sizeOf(context).width * 0.95,
                child: TextFormField(
                  controller: widget.controller,
                  onChanged: (value) {
                    setState(() {
                      filteredSuggestions = widget.countrySuggestions
                          .where((country) => country
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: kPrimaryColor),
                    prefixIconColor: kPrimaryColor,
                    hintText: 'Country, city',
                    prefixIcon: Icon(widget.iconData),
                    border: customOutlineInputBorder(color: kPrimaryColor),
                    enabledBorder:
                        customOutlineInputBorder(color: kPrimaryColor),
                    focusedBorder:
                        customOutlineInputBorder(color: kPrimaryColor),
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              Text(
                'Suggested places',
                style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.bold, color: kPrimaryColor),
              ),
              SizedBox(height: 10.h),
              // Display filtered suggestions
              Expanded(
                child: ListView.builder(
                  itemCount: filteredSuggestions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        widget.controller.text = filteredSuggestions[index];
                        Navigator.pop(context);
                      },
                      leading: const Icon(Icons.flight, color: kPrimaryColor),
                      title: Text(filteredSuggestions[index],
                          style: const TextStyle(color: kPrimaryColor)),
                      subtitle: const Text('city',
                          style: TextStyle(color: kPrimaryColor)),
                    );
                  },
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
