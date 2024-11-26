import 'package:flighter/features/payment/presentation/views/widgets/add_payment_widgets/add_payment_view_body.dart';
import 'package:flutter/material.dart';

class AddPaymentView extends StatelessWidget {
  const AddPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Payment'),
        centerTitle: true,
      ),
      body: const AddPaymentViewBody(),
    );
  }
}
