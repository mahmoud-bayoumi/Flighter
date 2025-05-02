// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../offers/presentation/view_model/get_offer_cubit/get_offer_cubit.dart';
import '../../view_model/search_cubit/search_cubit.dart';

class CurrencyModal extends StatefulWidget {
  final String selectedCurrency;

  const CurrencyModal({super.key, required this.selectedCurrency});

  @override
  State<CurrencyModal> createState() => _CurrencyModalState();
}

class _CurrencyModalState extends State<CurrencyModal> {
  late String _currentCurrency;

  @override
  void initState() {
    super.initState();
    _currentCurrency = widget.selectedCurrency;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, _currentCurrency); // Save on swipe-down/back
        return false;
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.pop(context, _currentCurrency); // Save on outside tap
        },
        child: GestureDetector(
          onTap: () {}, // Absorb inner tap gestures
          child: SingleChildScrollView(
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
                  _buildCurrencyOptions(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Select Currency',
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context, _currentCurrency); // Save on close button
          },
          color: kPrimaryColor,
        ),
      ],
    );
  }

  Widget _buildCurrencyOptions() {
    return Column(
      children: [
        RadioListTile<String>(
          title: Text('Egyptian Pound (EGP)', style: Styles.textStyle16),
          value: 'EGP',
          groupValue: _currentCurrency,
          activeColor: kPrimaryColor,
          onChanged: (value) {
            setState(() => _currentCurrency = value!);
          },
        ),
        const Divider(height: 1),
        RadioListTile<String>(
          title: Text('US Dollar (USD)', style: Styles.textStyle16),
          value: 'USD',
          groupValue: _currentCurrency,
          activeColor: kPrimaryColor,
          onChanged: (value) {
            setState(() => _currentCurrency = value!);
          },
        ),
        const Divider(height: 1),
      ],
    );
  }
}

Future<void> showCurrencyModal(
    BuildContext context, String selectedCurrency) async {
  final result = await showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => CurrencyModal(selectedCurrency: selectedCurrency),
  );

  if (result != null) {
    currency = result;
    await BlocProvider.of<GetOfferCubit>(context).getOffers();
    await BlocProvider.of<SearchCubit>(context).getSearchData();
  }
}
