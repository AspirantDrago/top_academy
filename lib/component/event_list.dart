import 'package:flutter/material.dart';
import 'package:top_academy/component/event_item.dart';
import 'package:top_academy/models/event.dart';

class EventList extends StatefulWidget {
  EventList({super.key});

  List<Event>? events = [
    Event(),
    Event(),
    Event(),
    Event(),
    Event(),
  ];

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    if (widget.events == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      if (widget.events!.isEmpty) {
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
        children: widget.events!.map((event) => EventItem(event: event)).toList()
      );
    }
  }
}
