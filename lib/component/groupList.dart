import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_academy/models/data_app.dart';
import 'package:top_academy/src/api.dart';

import '../models/group.dart';
import 'groupItem.dart';

class GroupList extends StatefulWidget {
  const GroupList({super.key});

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  List<Group> _groups = [];

  @override
  void initState() {
    super.initState();
    Api.getGroups(DataApp.filialId).then((value) {
      if (value != null) {
        setState(() {
          _groups = value.cast<Group>();
        });
      }
    }).catchError((e) {
      print('Error: $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: (_groups.isEmpty ? Center(child: CircularProgressIndicator()) :
        CupertinoScrollbar(
          child: ListView(
            children: _groups.map((Group group) => GroupItem(groupName: group.name)).toList(),
          ),
        )
      ),
    );
  }
}
