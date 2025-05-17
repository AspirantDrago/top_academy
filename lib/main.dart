import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_academy/component/dateSelector.dart';

import 'component/groupItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App!!',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        body: const MyHomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  List<String> getGroups() {
    List<String> arr = [];
    for (var i = 0; i < 20; i++) {
      arr.add("П${1 + i}1");
    }
    return arr;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Center(
                child: Text(
                    "список групп:",
                    style: TextStyle(
                        fontSize: 30,
                        decoration: TextDecoration.underline
                    )
                )
            ),
            SizedBox(
              height: 200,
              child: CupertinoScrollbar(
                child: ListView(
                  children: getGroups()
                      .map((String s) => GroupItem(groupName: s)).toList(),
                ),
              ),
            ),
            DateSelector()
          ],
        )
    );
  }
}
