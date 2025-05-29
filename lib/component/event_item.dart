import 'package:flutter/material.dart';
import 'package:top_academy/models/event.dart';

class EventItem extends StatelessWidget {
  final Event event;

  const EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      width: 100,
      height: 100,
    );
  }
}
