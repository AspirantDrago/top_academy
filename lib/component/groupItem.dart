import 'package:flutter/material.dart';

class GroupItem extends StatelessWidget {
  final String groupName;

  const GroupItem({super.key, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 20
      ),
      padding: EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 20
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
      ),
      child: Center(
        child: Text(
          groupName,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
