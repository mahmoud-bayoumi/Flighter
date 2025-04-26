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
    required this.forFrom,
    required this.controller,
  });

  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  List<String> countrySuggestions = [
    'Cairo', 'Alexandria', 'Aswan', 'Beni Suef', // Static examples
    'New York', 'London', 'Paris', 'Tokyo', 'Berlin',
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cabo Verde",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Central African Republic",
    "Chad",
    "Chile",
    "China",
    "Colombia",
    "Comoros",
    "Congo (Congo-Brazzaville)",
    "Costa Rica",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czechia (Czech Republic)",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Eswatini (fmr. Swaziland)",
    "Ethiopia",
    "Fiji",
    "Finland",
    "France",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Greece",
    "Grenada",
    "Guatemala",
    "Guinea",
    "Guinea-Bissau",
    "Guyana",
    "Haiti",
    "Holy See",
    "Honduras",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Italy",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Morocco",
    "Mozambique",
    "Myanmar (formerly Burma)",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "North Korea",
    "North Macedonia",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Palestine State",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Qatar",
    "Romania",
    "Russia",
    "Rwanda",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Korea",
    "South Sudan",
    "Spain",
    "Sri Lanka",
    "Sudan",
    "Suriname",
    "Sweden",
    "Switzerland",
    "Syria",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Timor-Leste",
    "Togo",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Vatican City",
    "Venezuela",
    "Vietnam",
    "Yemen",
    "Zambia",
    "Zimbabwe", // Static examples
  ];

  List<String> filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    filteredSuggestions = countrySuggestions; // Initially show all suggestions
    widget.controller.text = widget.forFrom ? 'Cairo' : 'Alexandria';
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          filteredSuggestions = countrySuggestions
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
                      filteredSuggestions = countrySuggestions
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
              widget.forFrom
                  ? const ListTile(
                      leading: Icon(Icons.my_location, color: kPrimaryColor),
                      title: Text('Current Location',
                          style: TextStyle(color: kPrimaryColor)),
                      subtitle: Text('Use current location',
                          style: TextStyle(color: kPrimaryColor)),
                    )
                  : const SizedBox.shrink(),
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
