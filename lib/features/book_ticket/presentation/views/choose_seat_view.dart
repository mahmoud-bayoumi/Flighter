import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/book_ticket/presentation/view_model/get_seats_cubit/get_seats_cubit.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/choose_seat_widgets/choose_seat_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChooseSeatView extends StatelessWidget {
  const ChooseSeatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          'Choose Seat',
          style: Styles.textStyle24,
        ),
      ),
      body: ChooseSeatViewBody(
        seatsModel: BlocProvider.of<GetSeatsCubit>(context).seatsModel,
      ),
    );
  }
}
