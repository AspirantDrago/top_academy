import 'package:flutter/material.dart';
import 'package:top_academy/models/data_app.dart';

class GroupItem extends StatefulWidget {
  final String groupName;
  bool isChecked;
  late GroupItemState _currentState;

  GroupItemState get currentState => _currentState;

  GroupItem({super.key, required this.groupName, this.isChecked = false});

  @override
  State<GroupItem> createState() {
    _currentState = GroupItemState();
    return _currentState;
  }
}

class GroupItemState extends State<GroupItem> {
  void toggle() {
    setState(() {
      if (widget.isChecked) {
        DataApp.groupItem = null;
        widget.isChecked = false;
      } else {
        widget.isChecked = true;
        if (DataApp.groupItem != null) {
          DataApp.groupItem?.currentState.toggle();
        }
        DataApp.groupItem = widget;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: Card(
        color: widget.isChecked ? Colors.blue[300] : Colors.white70,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: ListTile(
          leading: SizedBox(width: 40),
          title: Text(
            widget.groupName,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.navigate_next),
          ),
        ),
      ),
    );
  }
}
