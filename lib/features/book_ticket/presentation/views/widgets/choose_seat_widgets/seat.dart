import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/book_ticket/presentation/view_model/ticket_summary_cubit/ticket_summary_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/functions/show_snack_bar.dart';

class Seat extends StatefulWidget {
  final bool isReseved;
  final bool isAvaiable;
  final String seatName;

  const Seat(
      {super.key,
      this.isReseved = false,
      required this.seatName,
      required this.isAvaiable});

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  Color color = kUnSelectedSeatColor;
  Color textColor = Colors.black;
  bool isSelected = false;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return widget.isReseved
        ? Container(
            height: 45.w,
            width: 40.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: kGreyColor,
            ),
            child: Center(
              child: Text(
                widget.seatName,
                style: Styles.textStyle18.copyWith(color: Colors.white),
              ),
            ))
        : widget.isAvaiable
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    final cubit = BlocProvider.of<TicketSummaryCubit>(context);
                    
                 
                    final hasReachedLimit =
                        cubit.ticketCounter >= cubit.noOfTravelers;

                    if (!isSelected && !hasReachedLimit) {
                      // Select the seat
                      isSelected = true;
                      color = kPrimaryColor;
                      textColor = Colors.white;
                      cubit.ticketCounter++;
                      cubit.selectedSeats.add(widget.seatName);
                    } else if (isSelected) {
                      // Unselect the seat
                      isSelected = false;
                      color = kUnSelectedSeatColor;
                      textColor = Colors.black;
                      cubit.ticketCounter--;
                      cubit.selectedSeats.remove(widget.seatName);
                    } else {
                      // Optional feedback (when user tries to select more than allowed)

                      showSnackBar(context,
                          message:
                              'You can only select seats equal to the number of travelers.');
                    }
                  });
                },
                child: Container(
                  height: 45.w,
                  width: 40.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: color,
                  ),
                  child: Center(
                    child: Text(
                      widget.seatName,
                      style: Styles.textStyle18.copyWith(color: textColor),
                    ),
                  ),
                ),
              )
            : Container(
                height: 45.w,
                width: 40.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    widget.seatName,
                    style: Styles.textStyle18.copyWith(color: Colors.white),
                  ),
                ));
  }
}
