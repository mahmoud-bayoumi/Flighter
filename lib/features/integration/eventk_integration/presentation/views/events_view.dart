import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/integration/eventk_integration/presentation/views/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../view_model/get_event_data_cubit/get_event_data_cubit.dart';
import '../view_model/get_events_cubit/get_events_cubit.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kPrimaryColor,
        title: Text(
          'Events in ${BlocProvider.of<GetEventsCubit>(context).toCountry}',
          style: Styles.textStyle22,
        ),
      ),
      body: ListView.builder(
          itemCount: BlocProvider.of<GetEventsCubit>(context)
              .eventsModel
              .items!
              .length, // Example item count
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                BlocProvider.of<GetEventDataCubit>(context).eventId =
                    BlocProvider.of<GetEventsCubit>(context)
                        .eventsModel
                        .items![index]
                        .eventId!;
                await BlocProvider.of<GetEventDataCubit>(context)
                    .getEventsData();

                GoRouter.of(context).push(
                  AppRouter.kEventDeatils,
                  extra: BlocProvider.of<GetEventDataCubit>(context)
                      .eventModel, // should be a Map<String, dynamic>
                );
              },
              child: EventCard(
                  eventName: BlocProvider.of<GetEventsCubit>(context)
                      .eventsModel
                      .items![index]
                      .eventName!,
                  startDate: BlocProvider.of<GetEventsCubit>(context)
                      .eventsModel
                      .items![index]
                      .startDate!
                      .toString(),
                  eventPicture: BlocProvider.of<GetEventsCubit>(context)
                              .eventsModel
                              .items![index]
                              .eventPicture ==
                          'https://res.cloudinary.com/duisbdqlt/image/upload/v1749718842/ntbxvozalenu2lft1uvs.svg'
                      ? 'https://img.freepik.com/premium-vector/events-big-text-online-corporate-party-meeting-friends-colleagues-video-conference_501813-9.jpg'
                      : BlocProvider.of<GetEventsCubit>(context)
                          .eventsModel
                          .items![index]
                          .eventPicture!),
            );
          }),
    );
  }
}
