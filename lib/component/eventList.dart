import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_academy/component/eventItem.dart';

class EventList extends StatefulWidget {
  EventList({super.key});

  List<EventItem>? events = [EventItem()];
  // = [
  //   // EventItem(), EventItem(), EventItem(),
  //   // EventItem(), EventItem(), EventItem(),
  //   // EventItem(), EventItem(), EventItem(),
  // ];

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
        children: widget.events!,
      );
    }
  }
}
