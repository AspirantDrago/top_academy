import 'package:flutter/material.dart';
import 'package:top_academy/component/event_item.dart';
import 'package:top_academy/models/event.dart';

import '../models/group.dart';

class EventList extends StatefulWidget {
  EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    Group g = Group(id: 777, name: "TOP group");

    List<Event>? events = [
      Event(group: g),
      Event(group: g),
      Event(group: g),
      Event(group: g),
      Event(group: g),
    ];



    if (events == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      if (events!.isEmpty) {
        return Center(child: Text(
          "нет занятий",
          style: TextStyle(
              fontSize: 50
          ),
        ),);
      }
      return Wrap(
        direction: Axis.horizontal,
        spacing: 10,
        runSpacing: 10,
        children: events!.map((event) => EventItem(event: event)).toList()
      );
    }
  }
}
