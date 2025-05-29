import 'package:flutter/material.dart';
import 'package:top_academy/models/data_app.dart';
import 'package:top_academy/src/theme_colors.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  final DateFormat dateFormatter = DateFormat('dd.MM.yyyy');

  void nextDay() {
    setState(() {
      DataApp.date = DateTime(DataApp.date.year, DataApp.date.month, DataApp.date.day + 1);
    });
  }

  void prevDay() {
    setState(() {
      DataApp.date = DateTime(DataApp.date.year, DataApp.date.month, DataApp.date.day - 1);
    });
  }

  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    DataApp.date = DateTime(now.year, now.month, now.day);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: ThemeColors.redColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: prevDay,
            icon: Icon(
              Icons.navigate_before,
              color: Colors.white,
              size: 40,
            ),
          ),
          Text(
            dateFormatter.format(DataApp.date),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          IconButton(
            onPressed: nextDay,
            icon: Icon(
              Icons.navigate_next,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
