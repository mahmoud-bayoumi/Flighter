import 'package:flighter/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flighter/features/home/presentation/views/widgets/ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketsListViewBuilder extends StatelessWidget {
  const TicketsListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool firstTime = true;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: BlocProvider.of<SearchCubit>(context).searchModel.data!.length,
      itemBuilder: (context, index) {
        if (firstTime) {
          firstTime = false;
        } else {
          index;
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TicketWidget(
              ticketModel: BlocProvider.of<SearchCubit>(context)
                  .searchModel
                  .data![index]),
        );
      },
    );
  }
}
