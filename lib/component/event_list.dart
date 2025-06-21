import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:top_academy/component/event_item.dart';
import 'package:top_academy/models/event.dart';
import 'package:top_academy/src/api.dart';

import '../models/data_app.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() => EventListState();
}

class EventListState extends State<EventList> {
  List<Event> _events = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    loadEvents(); // первый запрос при старте
  }

  Future<void> loadEvents() async {
    setState(() => _isLoading = true); // включаем индикатор загрузки
    try {
      final value = await Api.getEvents(
        filialId: DataApp.filialId,
        groupId: null,
        date: DataApp.date,
      );
      if (value != null) {
        setState(() {
          _events = value.cast<Event>();
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating list of events: $e');
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // оборачиваем в RefreshIndicator для «потяни, чтобы обновить»
    return RefreshIndicator(
      onRefresh: loadEvents,
      child: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _events.isEmpty
          ? ListView( // нужен ListView, чтобы RefreshIndicator работал
        children: [
          SizedBox(height: 200),
          Center(
            child: Text("нет занятий", style: TextStyle(fontSize: 50)),
          ),
        ],
      )
          : Wrap(
        direction: Axis.horizontal,
        spacing: 10,
        runSpacing: 10,
        children: _events.map((e) => EventItem(event: e)).toList(),
      ),
    );
  }
}
