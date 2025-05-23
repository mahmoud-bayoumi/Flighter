import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../view_model/search_cubit/search_cubit.dart';

class FiltersModal extends StatefulWidget {
  final Map<String, bool> airlines;
  const FiltersModal({super.key, required this.airlines});

  @override
  State<FiltersModal> createState() => _FiltersModalState();
}

class _FiltersModalState extends State<FiltersModal> {
  Map<String, int> airlinesIndeses = {};
  @override
  void initState() {
    super.initState();
    int index = 1;
    widget.airlines.forEach((key, value) {
      airlinesIndeses[key] = index++; // Assign index to each airline
    });
  }

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
          icon: const Icon(Icons.check),
          onPressed: () {
            Navigator.pop(context);
            BlocProvider.of<SearchCubit>(context).secondPush = true;

            BlocProvider.of<SearchCubit>(context).getSearchData();
          },
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
                    onChanged: (value) => setState(() {
                      airlines[entry.key] = value!;
                      if (!BlocProvider.of<SearchCubit>(context)
                              .airlines
                              .contains(airlinesIndeses[entry.key]!) &&
                          airlines[entry.key]!) {
                        BlocProvider.of<SearchCubit>(context)
                            .airlines
                            .add(airlinesIndeses[entry.key]!);
                      } else if (!airlines[entry.key]!) {
                        BlocProvider.of<SearchCubit>(context)
                            .airlines
                            .remove(airlinesIndeses[entry.key]!);
                      }
                    }),
                  ),
                ),
                const Divider(height: 1),
              ],
            )),
      ],
    );
  }
}

void showFiltersModal(BuildContext context, Map<String, bool> airlines) {
  showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (context) => FiltersModal(
            airlines: airlines,
          ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ));
}
