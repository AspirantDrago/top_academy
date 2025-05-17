import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        children: [
          IconButton(
              onPressed: () => {},
              icon: Icon(Icons.navigate_before)
          ),
          Text('date'),
          IconButton(
              onPressed: () => {},
              icon: Icon(Icons.navigate_next)
          ),
        ],
      ),
    );
  }
}
