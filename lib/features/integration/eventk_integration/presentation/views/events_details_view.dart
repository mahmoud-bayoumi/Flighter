import 'package:flighter/features/integration/eventk_integration/presentation/views/widgets/event_deatils_view_%20body.dart';
import 'package:flutter/material.dart';

import '../../data/models/event_model/event_model.dart';

class EventDetailsView extends StatelessWidget {
  final EventModel event;

  const EventDetailsView({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return EventDetailsViewBody(
      eventName: event.eventName!,
      description: event.about!.description!,
      startDate: event.startDate!.toString(),
      endDate: event.endDate!.toString(),
      imageUrl: event.eventPicture.toString(),
      organizationName: event.organizationName.toString(),
      categories: event.about!.aboutCategories!,
    );
  }
}
