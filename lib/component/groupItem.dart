import 'package:flutter/material.dart';

class GroupItem extends StatelessWidget {
  final String groupName;

  const GroupItem({super.key, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: ListTile(
        title: Text(
            groupName,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24,)
        ),
        trailing: IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.navigate_next
            )
        ),
      ),
    );
  }
}
