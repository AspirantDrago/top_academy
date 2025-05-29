import 'package:flutter/material.dart';
import 'package:top_academy/models/event.dart';

class EventItem extends StatelessWidget {
  final Event event;

  const EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      width: 300,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: [
          Text(event.group.name, style: TextStyle(color: Colors.white70, fontSize: 15)),
          Text("предмет", style: TextStyle(color: Colors.white, fontSize: 30)),
          Text("аудитория", style: TextStyle(color: Colors.white70, fontSize: 15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("начало:", style: TextStyle(color: Colors.white70, fontSize: 20)),
              Text("время", style: TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
          Text("препод", style: TextStyle(color: Colors.white70, fontSize: 15)),
        ],
      ),
    );
  }
}
