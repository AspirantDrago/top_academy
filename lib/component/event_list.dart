import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:top_academy/component/event_item.dart';
import 'package:top_academy/models/event.dart';
import 'package:top_academy/src/api.dart';

import '../models/data_app.dart';
import '../models/group.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  List<Event> _events = [];

  @override
  void initState() {
    super.initState();
    Api.getEvents(
      filialId: DataApp.filialId,
      groupId: null,
      date: DataApp.date
    ).then((value) {
      if (value != null) {
        setState(() {
          _events = value.cast<Event>();
        });
      }
    }).catchError((e) {
      if (kDebugMode) {
        print('Error updating list of events: $e');
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    if (_events.isEmpty) {
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
      children: _events.map((event) => EventItem(event: event)).toList()
    );
    }
}
